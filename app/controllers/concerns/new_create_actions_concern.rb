# frozen_string_literal: true

module NewCreateActionsConcern
  extend ActiveSupport::Concern

  included do
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_create_record, only: %i[create new]
    before_action :authorize_create_record, only: %i[create new]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    # GET /<resource>/new
    def new
      render template: template_path
    end

    # POST /<resource>
    def create
      result = call_create_interactor
      if result.success?
        flash[:notice] = result.message
        redirect_to redirect_to_after_create, status: :see_other
      else
        flash.now[:alert] = result.message
        render template: template_path(:new), status: :unprocessable_content
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

      result = Kernel.const_get(interactor).call(post_context)
      @record = result.record
      result
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
