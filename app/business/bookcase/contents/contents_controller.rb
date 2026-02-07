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

      before_action :set_update_record, only: %i[edit_mode]
      before_action :authorize_update_record, only: %i[edit_mode]

      # POST /<resource>/:id/edit_mode
      def edit_mode
        inverse_content_edit_mode
        redirect_to @record
      end

      private

      def content_edit_mode?
        session.fetch(:content_edit_mode, false)
      end

      def inverse_content_edit_mode
        session[:content_edit_mode] = !content_edit_mode?
      end

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
        @record = model.friendly.includes(content_tags: [:content_tag_family]).includes(:book).find(params.fetch(:id))
      end
    end
  end
end
