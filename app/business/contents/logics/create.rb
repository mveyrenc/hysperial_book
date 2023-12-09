# frozen_string_literal: true

module Contents
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        # if context.params.key? :thumbnail
        #   context.record.thumbnail = Picture.new(context.params[:thumbnail])
        #   # context.fail!(message: 'create_record.failure') unless context.record.thumbnail.save
        #   context.params.delete(:thumbnail)
        # end
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
