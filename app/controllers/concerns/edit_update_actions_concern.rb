# frozen_string_literal: true

module EditUpdateActionsConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_update_record, only: %i[edit update]
    before_action :authorize_update_record, only: %i[edit update]

    # GET /<resource>/:id/edit
    def edit
      logger.debug(request.inspect)
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # PATCH/PUT /<resource>/:id
    def update
      result = call_update_interactor
      respond_to do |format|
        if result.success?
          flash.now.notice = result.message
          format.html { redirect_to redirect_to_after_update }
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

    def redirect_to_after_update
      raise NotImplementedError
    end

    def update_interactor
      "#{model.name.pluralize}::Interactors::UpdateInteractor"
    end

    def call_update_interactor
      interactor = update_interactor
      raise NotImplementedError, "#{interactor} not implemented" unless Object.const_defined?(interactor)

      Kernel.const_get(interactor).call(patch_context)
    end

    def patch_context
      Interactor::Context.build(record: @record, params: strong_params.to_h, current_user:)
    end

    def set_update_record
      @record = model.respond_to?(:friendly) ? model.friendly.find(params[:id]) : model.find(params[:id])
    end

    def authorize_update_record
      authorize @record, :update?
    end
  end
end
