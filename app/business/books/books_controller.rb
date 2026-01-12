# frozen_string_literal: true

# Books controller
module Books
  # Books controller
  class BooksController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]
    before_action :set_new_record, only: %i[create new]
    before_action :authorize_record, only: %i[create new edit update destroy]

    # GET /books
    def index
      authorize Book
      @records = Books::Logics::Search.call(query: params)

      render template: template_path
    end

    # GET /books/search
    def search
      authorize Book, :index?
      @records = Books::Logics::Search.call(query: params)

      render template: template_path('index')
    end

    # GET /books/new
    def new
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # GET /books/:id/edit
    def edit
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # POST /books
    def create
      result = Books::Logics::Create.call(post_context)
      respond_to do |format|
        if result.success?
          flash.now.notice = result.message
          format.html { redirect_to books_path }
          format.turbo_stream { render template: template_path }
        else
          flash.now.alert = result.message
          format.html { render template: template_path(:new), status: :unprocessable_entity }
          format.turbo_stream { render template: template_path(:new) }
        end
      end
    end

    # PATCH/PUT /books/:id
    def update
      result = Books::Logics::Update.call(post_context)

      respond_to do |format|
        if result.success?
          flash.now.notice = result.message
          format.html { redirect_to books_path }
          format.turbo_stream { render template: template_path }
        else
          flash.now.alert = t(".#{result.error}")
          format.html { render template: template_path(:edit), status: :unprocessable_entity }
          format.turbo_stream { render template: template_path(:edit) }
        end
      end
    end

    # DELETE /books/:id
    def destroy
      Books::Logics::Destroy.call(record: @record)

      respond_to do |format|
        format.html { redirect_to books_path, notice: result.message }
        format.turbo_stream { render template: template_path }
      end
    end

    private

    def set_record
      @record = Book.friendly.find(params[:id])
    end

    def set_new_record
      @record = Book.new
    end

    def strong_params
      params
        .require(:book)
        .permit(:name, :alternate_names, :description, :kind, :position)
    end

    def post_context
      Interactor::Context.build(record: @record, params: strong_params.to_h, current_user:)
    end
  end
end
