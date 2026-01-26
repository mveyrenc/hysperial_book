# frozen_string_literal: true

# ContentTags controller
module Bookcase
  module ContentTags
    # ContentTags controller
    class ContentTagsController < ApplicationController
      include IndexSearchActionsConcern
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::ContentTag
      end

      def redirect_to_after_create
        bookcase_content_tags_path
      end

      def redirect_to_after_update
        bookcase_content_tags_path
      end

      def redirect_to_after_destroy
        bookcase_content_tag_path
      end

      def strong_params
        params
          .require(:bookcase_content_tag)
          .permit(
            :content_tag_family_id,
            :name
          )
      end
    end
  end
end
