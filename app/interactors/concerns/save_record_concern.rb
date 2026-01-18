# frozen_string_literal: true

module SaveRecordConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    def call
      return context.fail!(message: t('.save_record.no_record')) if context.record.blank?

      if context.record.save
        context.message = t('.save_record.success')
      else
        context.fail!(message: t('.save_record.failure'))
      end
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
