# frozen_string_literal: true

module Contents
  module Logics
    module ContentFormProcessor
      extend ActiveSupport::Concern

      included do
        def record_from_params
          context.record.attributes = context.params
          context.record.created_by = context.current_user if context.record.new_record?
          context.record.updated_by = context.current_user
        end

        def thumbnail_from_params
          if record_has_thumbnail?
            context.record.thumbnail.created_by = context.current_user if context.record.thumbnail.new_record?
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
end
