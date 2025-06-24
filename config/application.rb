# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HysperialBook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Europe/Paris'
    # config.eager_load_paths << Rails.root.join("extras")

    # Add translations files from business
    config.i18n.load_path += Dir[Rails.root.join('app/business/*/locales/*.{rb,yml}')]

    # Don't generate system test files.
    config.generators.after_generate do |files|
      parsable_files = files.filter { |file| file.end_with?('.rb') }
      system("bundle exec rubocop -A --fail-level=E #{parsable_files.shelljoin}", exception: true)
    end

    config.autoload_paths += Dir["#{config.root}/app/business/concerns"]

    # To avoid conflicts between ViewComponent and other gems that also monkey patch the render method, it’s possible to
    # configure ViewComponent to not include the render monkey patch:
    config.view_component.render_monkey_patch_enabled = false # defaults to true
  end
end
