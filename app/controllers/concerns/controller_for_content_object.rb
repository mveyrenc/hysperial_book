# frozen_string_literal: true

module ControllerForContentObject

  extend ActiveSupport::Concern

  included do
    attr_reader :object
    before_action :set_object, only: %i[ show edit update destroy ]
  end

  def show
    render "#{content_component_module}::ShowView::Component".constantize.new(@object)
  end

  def new
    render("#{content_component_module}::NewView::Component".constantize.new(content_model_class.constantize.new), content_type: "text/html")
  end
  def edit
    render("#{content_component_module}::EditView::Component".constantize.new(@object), content_type: "text/html")
  end

  def create
    @object = content_model_class.constantize.new(book_params)

    if @object.save
      redirect_to index_path, notice: t('.success')
    else
      render "#{content_component_module}::NewView::Component".constantize.new(@object), status: :unprocessable_entity
    end
  end

  def update
    if @object.update(book_params)
      redirect_to index_path, notice: t('.success')
    else
      render "#{content_component_module}::EditView::Component".constantize.new(@object), status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @object.destroy
    redirect_to index_path, notice: t('.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @object = content_model_class.constantize.find(params[:id])
  end

  def index_path
    raise NotImplementedError
  end

  def content_model_class
    raise NotImplementedError
  end

  def content_component_module
    raise NotImplementedError
  end
end
