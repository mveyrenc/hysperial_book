# frozen_string_literal: true

class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ClassNameHelper
  include FetchOrFallbackHelper
  include OptionHelper

  include ActionText::Engine.helpers
  include ApplicationHelper

  def stimulus_controller_identifier
    @stimulus_controller_identifier ||= self.class.name.sub("::Component", "").underscore.split("/").join("--")
  end

  # We also add an ability to build a class from a different component
  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end

  def main_app
    Rails.application.class.routes.url_helpers
  end
end
