# frozen_string_literal: true

module Users
  module Interactors
    # Update a user and his role
    class Update < ApplicationInteractor
      def call
        update_attributes
      end

      def update_attributes
        context.fail!(message: 'update_user.failure') unless context.user.update(context.params)
      end
    end
  end
end
