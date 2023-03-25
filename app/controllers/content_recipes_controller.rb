# frozen_string_literal: true

class ContentRecipesController < ApplicationController

  include ControllerForContentObject

  private

  def index_path
    content_recipes_path
  end

  def content_model_class
    "ContentRecipe"
  end

  def content_component_module
    "ContentRecipes"
  end

end
