# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.6'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.2'

  # https://github.com/rubocop/rubocop-rails
  gem 'rubocop-rails', require: false

  # https://github.com/rubocop/rubocop-capybara
  gem 'rubocop-capybara', '~> 2.18'

  # https://github.com/flyerhzm/rails_best_practices
  gem 'rails_best_practices', '~> 1.23'

  # https://github.com/BetterErrors/better_errors
  gem 'better_errors', '~> 2.10'
  gem 'binding_of_caller', '~> 1.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# https://github.com/heartcombo/devise
gem 'devise', '~> 4.9'

# https://github.com/varvet/pundit
gem 'pundit', '~> 2.3'

# https://github.com/shlima/translate_enum
gem 'translate_enum', '~> 0.2.0', require: 'translate_enum/active_record'

# https://github.com/deivid-rodriguez/byebug
gem 'byebug', '~> 11.1', groups: %i[development test]

# https://github.com/janko/image_processing
gem 'image_processing', '~> 1.12'

# https://github.com/RolifyCommunity/rolify
gem 'rolify', '~> 6.0'

# https://github.com/slim-template/slim-rails
gem 'slim-rails', '~> 3.6'
