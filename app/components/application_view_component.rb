class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ActionText::Engine.helpers
  include ApplicationHelper

  def identifier
    @identifier ||= self.class.name.sub("::Component", "").underscore.split("/").join("--")
  end

  # We also add an ability to build a class from a different component
  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end

  def main_app
    Rails.application.class.routes.url_helpers
  end
end
