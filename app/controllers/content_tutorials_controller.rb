# frozen_string_literal: true

class ContentTutorialsController < ApplicationController

  include ControllerForContentObject

  private

  def index_path
    content_tutorials_path
  end

  def content_model_class
    "ContentTutorial"
  end

  def content_component_module
    "ContentTutorials"
  end

end
