# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    class ContentTaggingsController < ApplicationController
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::ContentTagging
      end

      def redirect_to_after_create
        bookcase_content_path(@relater_record)
      end

      def redirect_to_after_update
        bookcase_content_path(@relater_record)
      end

      def redirect_to_after_destroy
        bookcase_content_path(@relater_record)
      end

      def strong_params
        params
          .require(:bookcase_content_tagging)
          .permit(
            :content_tag_id
          )
      end

      def set_create_record
        @relater_record = Bookcase::Content.friendly.find(params[:content_id])
        @record = model.new(content: @relater_record)
      end

      def set_update_record
        @record = Bookcase::ContentTagging.find(params[:id])
        @relater_record = @record.content
      end

      def set_destroy_record
        @record = Bookcase::ContentTagging.find(params[:id])
        @relater_record = @record.content
      end
    end
  end
end
