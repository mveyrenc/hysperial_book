# frozen_string_literal: true

module EditUpdateActionsConcern
  extend ActiveSupport::Concern

  included do
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_update_record, only: %i[edit update]
    before_action :authorize_update_record, only: %i[edit update]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    # GET /<resource>/:id/edit
    def edit
      if render_inertia?
        render inertia: { record: }
      else
        render template: template_path
      end
    end

    # PATCH/PUT /<resource>/:id
    def update
      result = call_update_interactor
      if result.success?
        flash[:notice] = result.message
        redirect_to redirect_to_after_update, status: :see_other
      else
        flash.now[:alert] = result.message
        if render_inertia?
          redirect_to action: :edit, inertia: { errors: @record.errors }
        else
          render template: template_path(:edit), status: :unprocessable_content
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

      result = Kernel.const_get(interactor).call(patch_context)
      @record = result.record
      result
    end

    def patch_context
      Interactor::Context.build(record: @record, params: strong_params.to_h, current_user:)
    end

    def set_update_record
      @record = model.respond_to?(:friendly) ? model.friendly.find(params.expect(:id)) : model.find(params.expect(:id))
    end

    def authorize_update_record
      authorize @record, :update?
    end
  end
end
