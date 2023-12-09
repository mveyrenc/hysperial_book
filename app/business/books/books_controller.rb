# frozen_string_literal: true

# Books controller
module Books
  # Books controller
  class BooksController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]

    # GET /books
    def index
      authorize Book
      @records = Books::Logics::Search.call(params)

      render template: template_path
    end

    # GET /books/new
    def new
      @record = Book.new
      authorize @record

      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # GET /books/:id/edit
    def edit
      authorize @record

      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # POST /books
    def create
      @record = Book.new
      authorize @record

      result = Books::Logics::Create.call(record: @record, params: strong_params.to_h)
      if result.success?
        respond_to do |format|
          format.html { redirect_to books_url, notice: t('.successfully_created') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:new), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /books/:id
    def update
      authorize @record
      result = Books::Logics::Update.call(record: @record, params: strong_params.to_h)

      if result.success?
        respond_to do |format|
          format.html { redirect_to books_url, notice: t('.successfully_updated') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:edit), status: :unprocessable_entity
      end
    end

    # DELETE /books/:id
    def destroy
      authorize @record
      Books::Logics::Destroy.call(record: @record)

      respond_to do |format|
        format.html { redirect_to books_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
      end
    end

    private

    def set_record
      @record = Book.friendly.find(params[:id])
    end

    def strong_params
      params.require(:book).permit(:title, :subtitle, :kind, :position)
    end
  end
end
