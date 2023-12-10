# frozen_string_literal: true

module Contents
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      include ContentFormProcessor

      def call
        create_from_params
      end

      private

      def create_from_params
        record_from_params
        thumbnail_from_params
        if context.record.save
          initialize_content_tree
          context.success!
        else
          context.fail!(message: 'create_record.failure')
        end
      end
    end
  end
end
