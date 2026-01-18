# frozen_string_literal: true

module DestroyRecordConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    def call
      return context.fail!(message: t('.destroy_record.no_record')) if context.record.blank?

      if context.record.destroy
        context.message = t('.destroy_record.success')
      else
        context.fail!(message: t('.destroy_record.failure'))
      end
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
