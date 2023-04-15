# frozen_string_literal: true

class ContentArticlesController < ApplicationController

  include ControllerForContentObject

  private

  def content_model_class
    "ContentArticle"
  end

  def content_component_module
    "ContentArticles"
  end

  def content_params
    super
  end

end
