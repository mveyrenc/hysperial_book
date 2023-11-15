# frozen_string_literal: true

module Users
  module Logics
    # Update a user and his role
    class Update < ApplicationInteractor
      def call
        update_attributes
      end

      def update_attributes
        context.fail!(message: 'update_record.failure') unless context.record.update(context.params)
      end
    end
  end
end
