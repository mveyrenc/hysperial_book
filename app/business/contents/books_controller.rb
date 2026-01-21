# frozen_string_literal: true

# Books controller
module Contents
  # Books controller
  class BooksController < ApplicationController
    include IndexSearchActionsConcern

    before_action :set_book_record, only: %i[index search]

    private

    def model
      Content
    end

    def set_book_record
      @book_record = Book.friendly.find(params[:book_id])
    end

    def search_context
      Interactor::Context.build(query: params, book: @book_record)
    end
  end
end
