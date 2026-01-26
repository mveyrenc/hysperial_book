# frozen_string_literal: true

# Contents controller
module Bookcase
  module Contents
    # Contents controller
    class ContentsController < ApplicationController
      include IndexSearchActionsConcern
      include ShowActionConcern
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::Content
      end

      def redirect_to_after_create
        bookcase_contents_path
      end

      def redirect_to_after_update
        bookcase_contents_path
      end

      def redirect_to_after_destroy
        bookcase_contents_path
      end

      def strong_params
        params
          .require(:bookcase_content)
          .permit(
            :book_id,
            :name,
            :alternate_names,
            :kind,
            :version,
            :source_url,
            thumbnail_attributes: %i[id file]
          )
      end

      def set_show_record
        @record = model.friendly.includes(content_tags: [:content_tag_family]).includes(:book).find(params[:id])
      end
    end
  end
end
