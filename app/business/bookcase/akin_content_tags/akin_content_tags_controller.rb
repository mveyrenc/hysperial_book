# frozen_string_literal: true

module Bookcase
  module AkinContentTags
    class AkinContentTagsController < ApplicationController
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::AkinContentTag
      end

      def redirect_to_after_create
        @relater_record
      end

      def redirect_to_after_update
        @relater_record
      end

      def redirect_to_after_destroy
        @relater_record
      end

      def strong_params
        params
          .require(:bookcase_akin_content_tag)
          .permit(
            :related_content_tag_id,
            :kind
          )
      end

      def set_create_record
        relater = Bookcase::ContentTag.friendly.find(params[:relater_id])
        @record = model.new(relater: relater)
      end

      def set_update_record
        @record = Bookcase::AkinContentTag.find(params[:id])
        @relater_record = @record.relater
      end

      def set_destroy_record
        @record = Bookcase::AkinContentTag.find(params[:id])
        @relater_record = @record.relater
      end
    end
  end
end
