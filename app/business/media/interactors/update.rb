# frozen_string_literal: true

module Media
  module Interactors
    # Update a medium
    class Update < ApplicationInteractor
      def call
        update_from_params
      end

      def update_from_params
        context.fail!(message: 'update_medium.failure') unless context.medium.update(attributes)
      end
    end
  end
end
