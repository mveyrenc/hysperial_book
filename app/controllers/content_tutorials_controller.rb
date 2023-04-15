# frozen_string_literal: true

class ContentTutorialsController < ApplicationController

  include ControllerForContentObject

  private

  def content_model_class
    "ContentTutorial"
  end

  def content_component_module
    "ContentTutorials"
  end

  def content_params
    super
  end

end
