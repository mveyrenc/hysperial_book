# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    class ContentAttributesController < ApplicationController
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::ContentAttribute
      end

      def redirect_to_after_create
        @record.content
      end

      def redirect_to_after_update
        @record.content
      end

      def redirect_to_after_destroy
        @record.content
      end

      def strong_params
        params
          .require(:bookcase_content_attribute)
          .permit(
            :name,
            :body_html,
            :body_json,
            :position,
            :content_id
          )
      end

      def set_create_record
        if params.key?(:content_id)
          content = Bookcase::Content.friendly.find(params.fetch(:content_id))
          @record = model.new(content: content)
        else
          @record = model.new
        end
      end
    end
  end
end
