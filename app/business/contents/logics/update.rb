# frozen_string_literal: true

module Contents
  module Logics
    # Update a content
    class Update < ApplicationInteractor
      include ContentFormProcessor

      def call
        update_from_params
      end

      def update_from_params
        record_from_params
        thumbnail_from_params
        if context.record.save
          initialize_content_tree
          context.success!
        else
          context.fail!(message: 'update_record.failure')
        end
      end
    end
  end
end
