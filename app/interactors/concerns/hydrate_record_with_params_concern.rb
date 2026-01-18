# frozen_string_literal: true

module HydrateRecordWithParamsConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :hydrate_record_with_params

    private

    def hydrate_record_with_params
      return context.fail!(message: t('.hydrate_record.no_record')) if context.record.blank?

      context.record.attributes = context.params
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
