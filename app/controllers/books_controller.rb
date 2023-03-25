# frozen_string_literal: true

class BooksController < ApplicationController

  before_action :set_object, only: %i[ show edit update destroy ]

  def index
    render(Books::IndexView::Component.new(Book.sorted), content_type: "text/html")
  end

  def show
    render Books::ShowView::Component.new(@object)
  end

  def new
    render(Books::NewView::Component.new(Book.new), content_type: "text/html")
  end
  def edit
    render(Books::EditView::Component.new(@object), content_type: "text/html")
  end

  def create
    @object = Book.new(book_params)

    if @object.save
      redirect_to books_path, notice: t('.success')
    else
      render Books::NewView::Component.new(@object), status: :unprocessable_entity
    end
  end

  def update
    if @object.update(book_params)
      redirect_to books_path, notice: t('.success')
    else
      render Books::EditView::Component.new(@object), status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @object.destroy
    redirect_to books_path, notice: t('.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @object = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :color, :icon, :short_description, :description)
  end

end
