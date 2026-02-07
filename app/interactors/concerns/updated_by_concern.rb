# frozen_string_literal: true

module UpdatedByConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_record_updated_by

    private

    def set_record_updated_by
      if context.record.respond_to?('updated_by')
        return context.fail!(message: t('.update_record.no_current_user')) if context.current_user.blank?
        return context.fail!(message: t('.update_record.no_record')) if context.record.blank?

        context.record.updated_by = context.current_user
      end
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
