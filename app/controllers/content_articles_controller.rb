# frozen_string_literal: true

class ContentArticlesController < ApplicationController

  include ControllerForContentObject

  private

  def index_path
    content_articles_path
  end

  def content_model_class
    "ContentArticle"
  end

  def content_component_module
    "ContentArticles"
  end

end
