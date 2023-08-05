# frozen_string_literal: true

# Books controller
module Books
  # Books controller
  class BooksController < ApplicationController
    before_action :set_book, only: %i[edit update destroy]

    # GET /books
    def index
      result = Books::Interactors::List.call(params)

      render Books::ViewComponents::ListComponent.new(books: result.list), content_type: 'text/html'
    end

    # GET /books/:id/edit
    def edit
      @book.validate
      render Books::ViewComponents::EditComponent.new(book: @book), content_type: 'text/html'
    end

    # PATCH/PUT /books/:id
    def update
      result = Books::Interactors::Update.call(book: @book, params: strong_params.to_h)

      if result.success?
        redirect_to books_url, notice: t('.successfully_updated')
      else
        redirect_to edit_book_url(@book), status: :unprocessable_entity
      end
    end

    private

    def set_book
      @book = Book.friendly.find(params[:id])
    end

    def strong_params
      params.require(:book).permit(:title, :subtitle, :kind, :short_description, :description)
    end
  end
end
