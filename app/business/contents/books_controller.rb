# frozen_string_literal: true

# Books controller
module Contents
  # Books controller
  class BooksController < ApplicationController
    before_action :set_book_record, only: %i[index search]

    # GET /books/:book_id/contents
    def index
      authorize Content
      @records = Contents::Logics::Search.call(query: params)

      render template: template_path
    end

    # GET  /books/:book_id/contents/search
    def search
      authorize Content, :index?
      @records = Contents::Logics::Search.call(query: params)

      render template: template_path('index')
    end

    private

    def set_book_record
      @book_record = Book.friendly.find(params[:book_id])
    end
  end
end
