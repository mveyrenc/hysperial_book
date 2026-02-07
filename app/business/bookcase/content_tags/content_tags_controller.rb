# frozen_string_literal: true

module Bookcase
  module ContentTags
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
        if params.key?(:from) && params.fetch(:from) == 'content_tag_family'
          Bookcase::ContentTagFamily.friendly.find(params.fetch(:bookcase_content_tag).fetch(:content_tag_family_id))
        else
          bookcase_content_tags_path
        end
      end

      def redirect_to_after_update
        if params.key?(:from) && params.fetch(:from) == 'content_tag_family'
          @record.content_tag_family
        else
          @record
        end
      end

      def redirect_to_after_destroy
        if params.key?(:from) && params.fetch(:from) == 'content_tag_family'
          @record.content_tag_family
        else
          bookcase_content_tags_path
        end
      end

      def strong_params
        params
          .require(:bookcase_content_tag)
          .permit(
            :content_tag_family_id,
            :name
          )
      end

      def set_create_record
        if params.key?(:content_tag_family_id)
          ctf = Bookcase::ContentTagFamily.friendly.find(params.fetch(:content_tag_family_id))
          @record = model.new(content_tag_family: ctf)
        else
          @record = model.new
        end
      end

      def set_show_record
        @record = model.friendly
                       .includes(:content_tag_family)
                       .find(params.fetch(:id))
      end
    end
  end
end
