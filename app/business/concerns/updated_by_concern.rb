# frozen_string_literal: true

module UpdatedByConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_record_updated_by

    private

    def set_record_updated_by
      return context.fail!(message: t('.update_record.no_current_user')) unless context.current_user.present?
      return context.fail!(message: t('.update_record.no_record')) unless context.record.present?

      context.record.updated_by = context.current_user
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
