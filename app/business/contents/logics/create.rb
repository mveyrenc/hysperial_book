# frozen_string_literal: true

module Contents
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        # context.record.build_thumbnail

        context.record.thumbnail = nil unless context.params.key? :thumbnail_attributes
        context.record.attributes = context.params
        context.record.created_by = context.current_user
        context.record.updated_by = context.current_user
        if context.record.thumbnail
          context.record.thumbnail.created_by = context.current_user
          context.record.thumbnail.updated_by = context.current_user
        end
        if context.record.save
          context.success!
        else
          context.fail!(message: 'create_record.failure')
        end
      end
    end
  end
end
