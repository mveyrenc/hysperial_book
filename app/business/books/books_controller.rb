# frozen_string_literal: true

# Books controller
module Books
  # Books controller
  class BooksController < ApplicationController
    before_action :set_book, only: %i[edit update destroy]

    # GET /books or /books.json
    def index
      result = Books::Interactors::List.call(params)

      render Books::ViewComponents::ListComponent.new(books: result.list), content_type: 'text/html'
    end

    # GET /books/1/edit
    def edit
      render Books::ViewComponents::EditComponent.new(book: @book), content_type: 'text/html'
    end

    # PATCH/PUT /books/1 or /books/1.json
    def update
      result = Books::Interactors::Update.call(book: @book, params: strong_params.to_h)

      if result.success?
        redirect_to books_url, notice: 'Book was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_book
      @book = Book.friendly.find(params[:id])
    end

    def strong_params
      params.require(:book).permit(:title, :subtitle, :short_description, :description)
    end
  end
end
