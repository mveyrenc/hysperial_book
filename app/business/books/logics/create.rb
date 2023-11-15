# frozen_string_literal: true

module Books
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        context.record.attributes = context.params

        if context.record.save
          context.success!
        else
          context.fail!(message: 'create_record.failure')
        end
      end
    end
  end
end
