# frozen_string_literal: true

module ShowActionConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_show_record, only: %i[show]
    before_action :authorize_show_record, only: %i[show]
    before_action :decorate_show_record, only: %i[show]

    # GET /<resource>/:id
    def show
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    protected

    def model
      raise NotImplementedError
    end

    def set_show_record
      @record = model.respond_to?(:friendly) ? model.friendly.find(params[:id]) : model.find(params[:id])
    end

    def authorize_show_record
      authorize @record, :show?
    end

    def decorate_show_record
      decorator = record_decorator
      return unless Object.const_defined?(decorator)

      @record = Kernel.const_get(decorator).decorate(@record)
    end

    def record_decorator
      "#{model.name.pluralize}::Decorators::RecordDecorator"
    end
  end
end
