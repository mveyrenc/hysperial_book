# frozen_string_literal: true

class ContentRecipesController < ApplicationController

  include ControllerForContentObject

  private

  def content_model_class
    "ContentRecipe"
  end

  def content_component_module
    "ContentRecipes"
  end

  def content_params
    super
  end

end
