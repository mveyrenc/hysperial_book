# frozen_string_literal: true

module Media
  module Logics
    # Update a medium
    class Update < ApplicationInteractor
      def call
        update_from_params
      end

      def update_from_params
        context.fail!(message: 'update_record.failure') unless context.record.update(attributes)
      end
    end
  end
end
