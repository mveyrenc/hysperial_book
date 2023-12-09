# frozen_string_literal: true

module Contents
  module Logics
    # Update a content
    class Update < ApplicationInteractor
      def call
        update_from_params
      end

      def update_from_params
        context.fail!(message: 'update_record.failure') unless context.record.update(context.params)
      end
    end
  end
end
