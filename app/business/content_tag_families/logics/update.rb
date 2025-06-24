# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # Update a tag
    class Update < ApplicationInteractor
      def call
        update_from_params
      end

      def update_from_params
        context.record.updated_by = context.current_user
        context.fail!(message: 'update_record.failure') unless context.record.update(context.params)
      end
    end
  end
end
