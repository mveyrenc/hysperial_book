# frozen_string_literal: true

module Contents
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      private

      def create_from_params
        create_record_from_params
        create_thumbnail_from_params

        if context.record.save
          context.success!
        else
          context.fail!(message: 'create_record.failure')
        end
      end

      def create_record_from_params
        context.record.attributes = context.params
        context.record.created_by = context.current_user
        context.record.updated_by = context.current_user
      end

      def create_thumbnail_from_params
        if record_has_thumbnail?
          context.record.thumbnail.created_by = context.current_user
          context.record.thumbnail.updated_by = context.current_user
        else
          context.record.thumbnail = nil
        end
      end

      def record_has_thumbnail?
        context.record.thumbnail&.file&.attached?
      end
    end
  end
end
