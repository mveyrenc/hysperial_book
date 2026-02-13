# frozen_string_literal: true

module Bookcase
  module Books
    class BooksController < ApplicationController
      include IndexSearchActionsConcern
      include ShowActionConcern
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def model
        Bookcase::Book
      end

      def redirect_to_after_create
        @record
      end

      def redirect_to_after_update
        @record
      end

      def redirect_to_after_destroy
        bookcase_books_path
      end

      def strong_params
        params
          .require(:bookcase_book)
          .permit(
            :alternate_names,
            :description,
            :kind,
            :name,
            :position
          )
      end
    end
  end
end
