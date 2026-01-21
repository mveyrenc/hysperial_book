# frozen_string_literal: true

module NewCreateActionsConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_create_record, only: %i[create new]
    before_action :authorize_create_record, only: %i[create new]

    # GET /<resource>/new
    def new
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # POST /<resource>
    def create
      result = call_create_interactor
      respond_to do |format|
        if result.success?
          flash.now.notice = result.message
          format.html { redirect_to redirect_to_after_create }
          format.turbo_stream { render template: template_path }
        else
          flash.now.alert = result.message
          format.html { render template: template_path(:new), status: :unprocessable_content }
          format.turbo_stream { render template: template_path(:new) }
        end
      end
    end

    protected

    def model
      raise NotImplementedError
    end

    def redirect_to_after_create
      raise NotImplementedError
    end

    def create_interactor
      "#{model.name.pluralize}::Interactors::CreateInteractor"
    end

    def call_create_interactor
      interactor = create_interactor
      raise NotImplementedError, "#{interactor} not implemented" unless Object.const_defined?(interactor)

      Kernel.const_get(interactor).call(post_context)
    end

    def post_context
      Interactor::Context.build(record: @record, params: strong_params.to_h, current_user:)
    end

    def set_create_record
      @record = model.new
    end

    def authorize_create_record
      authorize @record, :create?
    end
  end
end
