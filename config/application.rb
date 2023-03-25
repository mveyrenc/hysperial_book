require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HysperialBook
  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.autoload_paths << Rails.root.join("app", "components")
    config.autoload_paths << Rails.root.join("app", "inputs")

    config.view_component.preview_paths << Rails.root.join("app", "components")

    config.view_component.generate.locale = true
    config.view_component.generate.distinct_locale_files = true
  end
end
