# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    class ContentTagFamiliesController < ApplicationController
      include IndexSearchActionsConcern
      include ShowActionConcern
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::ContentTagFamily
      end

      def redirect_to_after_create
        if params.key?(:from) && params[:from] == 'book'
          Bookcase::Book.friendly.find(params[:bookcase_content_tag_family][:book_id])
        else
          bookcase_content_tag_families_path
        end
      end

      def redirect_to_after_update
        if params.key?(:from) && params[:from] == 'book'
          @record.book
        else
          @record
        end
      end

      def redirect_to_after_destroy
        if params.key?(:from) && params[:from] == 'book'
          @record.book
        else
          bookcase_content_tag_families_path
        end
      end

      def strong_params
        params
          .require(:bookcase_content_tag_family)
          .permit(
            :alternate_names,
            :book_id,
            :description,
            :kind,
            :name,
            :position
          )
      end

      def set_create_record
        if params.key?(:book_id)
          b = Bookcase::Book.friendly.find(params[:book_id])
          @record = model.new(book: b)
        else
          @record = model.new
        end
      end

      def set_show_record
        @record = model.friendly
                       .includes(:book)
                       .find(params[:id])
      end
    end
  end
end
