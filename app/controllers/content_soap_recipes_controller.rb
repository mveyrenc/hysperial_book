# frozen_string_literal: true

class ContentSoapRecipesController < ApplicationController

  include ControllerForContentObject

  private

  def content_model_class
    "ContentSoapRecipe"
  end

  def content_component_module
    "ContentSoapRecipes"
  end

  def content_params
    super
  end

end
