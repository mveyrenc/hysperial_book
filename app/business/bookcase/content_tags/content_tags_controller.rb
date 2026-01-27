# frozen_string_literal: true

# ContentTags controller
module Bookcase
  module ContentTags
    # ContentTags controller
    class ContentTagsController < ApplicationController
      include IndexSearchActionsConcern
      include ShowActionConcern
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

      def set_show_record
        @record = model.friendly
                       .includes([:content_tag_family])
                       # .includes(content_tag_family: [:book])
                       # .includes(related_akin_content_tags: {related: {content_tag_family: :book}})
                       .find(params[:id])
      end
    end
  end
end
