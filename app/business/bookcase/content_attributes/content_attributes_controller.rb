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
        bookcase_content_path(@record.content)
      end

      def redirect_to_after_destroy
        bookcase_content_path(@record.content)
      end

      def strong_params
        params
          .require(:bookcase_content_attribute)
          .permit(
            :plain_text,
            :markdown_text,
            :html_text,
            :data_text,
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
