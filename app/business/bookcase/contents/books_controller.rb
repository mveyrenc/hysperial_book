# frozen_string_literal: true

# Books controller
module Bookcase
  module Contents
    # Books controller
    class BooksController < ApplicationController
      include IndexSearchActionsConcern

      before_action :set_book_record, only: %i[index search]

      private

      def model
        Bookcase::Content
      end

      def set_book_record
        @book_record = Bookcase::Book.friendly.find(params[:book_id])
      end

      def search_context
        Interactor::Context.build(query: params, book: @book_record)
      end
    end
  end
end
