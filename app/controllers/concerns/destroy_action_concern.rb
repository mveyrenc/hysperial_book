# frozen_string_literal: true

module DestroyActionConcern
  extend ActiveSupport::Concern

  included do
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_destroy_record, only: %i[destroy]
    before_action :authorize_destroy_record, only: %i[destroy]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    # DELETE /<resource>/:id
    def destroy
      result = call_destroy_interactor

      flash['notice'] = result.message
      redirect_to redirect_to_after_destroy, status: :see_other
    end

    protected

    def model
      raise NotImplementedError
    end

    def redirect_to_after_destroy
      raise NotImplementedError
    end

    def destroy_interactor
      "#{model.name.pluralize}::Interactors::DestroyInteractor"
    end

    def call_destroy_interactor
      interactor = destroy_interactor
      raise NotImplementedError, "#{interactor} not implemented" unless Object.const_defined?(interactor)

      Kernel.const_get(interactor).call(delete_context)
    end

    def delete_context
      Interactor::Context.build(record: @record)
    end

    def set_destroy_record
      @record = model.respond_to?(:friendly) ? model.friendly.find(params.expect(:id)) : model.find(params.expect(:id))
    end

    def authorize_destroy_record
      authorize @record, :destroy?
    end
  end
end
