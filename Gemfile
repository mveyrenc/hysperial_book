# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.8'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 7.2'

# ########
# Database
# ########

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# https://github.com/ankane/pghero
# A performance dashboard for Postgres
gem 'pghero', '~> 3.7'

# https://github.com/pganalyze/pg_query
# This Ruby extension uses the actual PostgreSQL server source to parse SQL queries and return the internal PostgreSQL parsetree.
gem 'pg_query', '~> 6.2'

# https://github.com/pawurb/rails-pg-extras
# Get useful insights on your database health
gem 'rails-pg-extras', '~> 5.6'

# https://github.com/evilmartians/evil-seed
# Create partial anonymized dump of your production database to perform
# profiling and benchmarking locally
# gem 'evil-seed'

# ###############################
# Attributes cleanup & sanitizing
# ###############################

# https://github.com/rmm5t/strip_attributes
# StripAttributes is an ActiveModel extension that automatically strips all attributes of leading and trailing
# whitespace before validation. If the attribute is blank, it strips the value to nil by default.
gem 'strip_attributes', '~> 2.0'

# #######################
# ActiveRecord extensions
# #######################

# https://github.com/collectiveidea/awesome_nested_set
# Awesome Nested Set is an implementation of the nested set pattern for ActiveRecord models.
gem 'awesome_nested_set', '~> 3.6'

# https://github.com/brendon/positioning
# The aim of this gem is to allow you to easily position Active Record model instances within a scope of your choosing.
gem 'positioning', '~> 0.4'

# https://github.com/norman/friendly_id
# FriendlyId is the "Swiss Army bulldozer" of slugging and permalink plugins for Active Record
gem 'friendly_id', '~> 5.5'

# https://github.com/CompanyCam/tiptap-ruby
# A gem for parsing, generating, and rendering TipTap Documents and Nodes using Ruby.

# ##############
# Business logic
# ##############
#
# https://github.com/collectiveidea/interactor
# https://github.com/collectiveidea/interactor-rails
gem 'interactor-rails', '~> 2.2'

# https://github.com/drapergem/draper
# Draper adds an object-oriented layer of presentation logic to your Rails application.
gem 'draper', '~> 4.0'

# ################################
# Application maintenance & health
# ################################

# https://github.com/ankane/strong_migrations
# Catch unsafe migrations in development
# gem 'strong_migrations', '~> 2.5'

# ################
# Assets, CSS & JS
# ################

# https://github.com/rails/propshaft
# Propshaft is an asset pipeline library for Rails
gem 'propshaft', '~> 1.3'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails', '~> 1.3'

# https://github.com/rails/dartsass-rails
# Sass is a stylesheet language that’s compiled to CSS.
gem 'dartsass-rails', '~> 0.5'

# https://github.com/hotwired/turbo-rails
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 2.0'

# https://github.com/marcoroth/turbo_power-rails
# TurboPower Rails is a power-pack for Turbo Streams
gem 'turbo_power', '~> 0.7'

# https://github.com/hotwired/stimulus-rails
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.3'

# https://guides.rubyonrails.org/active_storage_overview.html#transforming-images
# Use Active Storage variants
gem 'image_processing', '~> 1.2'

# ###################################
# User authentication and permissions
# ###################################

# https://github.com/heartcombo/devise
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 5.0'

# https://github.com/varvet/pundit
# Pundit provides a set of helpers which guide you in leveraging regular Ruby classes and object oriented design
# patterns to build a straightforward, robust, and scalable authorization system.
gem 'pundit', '~> 2.3'

# https://github.com/roidrage/redis-session-store
# A simple Redis-based session store for Rails
gem 'redis-session-store', '~> 0.11.5'

# #################
# Templating, views
# #################

# https://github.com/slim-template/slim-rails
# slim-rails provides Slim generators for Rails
gem 'slim-rails', '~> 4.0'

# https://viewcomponent.org/guide/getting-started.html
# A framework for creating reusable, testable & encapsulated view components, built to integrate seamlessly with
# Ruby on Rails.
gem 'view_component', '~> 4.1'

# https://github.com/kaminari/kaminari
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks
# and ORMs
gem 'kaminari', '~> 1.2'
# TODO: try https://github.com/ddnexus/pagy

# ######
# Search
# ######

# https://github.com/ankane/searchkick
# Intelligent search made easy
gem 'searchkick', '~> 6.0'

# https://github.com/opensearch-project/opensearch-ruby
# OpenSearch Ruby Client
gem 'opensearch-ruby', '~> 3.4'

# ##########
# Other gems
# ##########

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.14'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.22'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]

  # https://github.com/deivid-rodriguez/byebug
  # Byebug is a simple to use and feature rich debugger for Ruby.
  gem 'byebug', '~> 13.0'

  # https://github.com/faker-ruby/faker
  # Generate (almost) realistic fake data for testing, demos, and populating your database during development.
  gem 'faker', '~> 3.6'

  # https://github.com/flyerhzm/bullet
  # It will watch your queries while you develop your application and notify you when you should add eager loading
  # (N+1 queries)
  gem 'bullet'

  # https://github.com/plentz/lol_dba
  # lol_dba is a small package of rake tasks that scan your application models and displays a list of columns that
  # probably should be indexed. Also, it can generate .sql migration scripts.
  # $ lol_dba db:find_indexes
  gem 'lol_dba'

  # https://github.com/jhawthorn/vernier
  # Next-generation Ruby 3.2.1+ sampling profiler. Tracks multiple threads, GVL activity, GC pauses, idle time,
  # and more.
  gem 'vernier', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # https://github.com/drwl/annotaterb
  # A Ruby Gem that adds annotations to your Rails models and route files.
  # $ annotaterb models
  # $ annotaterb routes
  gem 'annotaterb', '~> 4.21'

  # https://github.com/djezzzl/database_consistency
  # The main goal of the project is to help you avoid various issues due to inconsistencies and inefficiencies between
  # a database schema and application models.
  # $ database_consistency
  gem 'database_consistency', require: false

  # https://github.com/palkan/isolator
  # Detect non-atomic interactions within DB transactions.
  # gem 'isolator'

  # https://github.com/Envek/after_commit_everywhere
  # Allows to use ActiveRecord transactional callbacks outside of ActiveRecord models, literally everywhere in
  # your application.
  # gem 'after_commit_everywhere'

  # https://github.com/rubocop/rubocop-rails
  gem 'rubocop-rails', require: false

  # https://github.com/flyerhzm/rails_best_practices
  # rails_best_practices is a code metric tool to check the quality of Rails code.
  # $ rails_best_practices -e "db/migrate,vendor" .
  gem 'rails_best_practices', require: false

  # https://github.com/BetterErrors/better_errors
  # Better Errors replaces the standard Rails error page with a much better and more useful error page
  gem 'better_errors'

  # https://github.com/banister/binding_of_caller
  # The binding_of_caller gem provides the Binding#of_caller method.
  gem 'binding_of_caller'

  # https://github.com/qqshfox/meta_request
  # Supporting gem for Rails Panel (Google Chrome extension for Rails development).
  gem 'meta_request', require: false

  # https://github.com/glebm/i18n-tasks
  # i18n-tasks helps you find and manage missing and unused translations.
  # $ i18n-tasks health
  gem 'i18n-tasks'

  # https://github.com/presidentbeef/brakeman
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  # run: $ brakeman -I
  gem 'brakeman', '~> 8.0'

  # https://github.com/danger/danger
  # Danger runs during your CI process, and gives teams the chance to automate common code review chores.
  # gem 'danger'

  # https://github.com/zombocom/derailed_benchmarks
  # A series of things you can use to benchmark a Rails or Ruby app.
  # All commands in this section will begin with $ derailed bundle:
  # gem 'derailed_benchmarks'

  # https://github.com/tmm1/stackprof
  # A sampling call-stack profiler for Ruby.
  # gem 'stackprof'

  # https://github.com/MiniProfiler/rack-mini-profiler
  # Middleware that displays speed badge for every HTML page
  # gem 'rack-mini-profiler'

  # https://github.com/fastruby/next_rails
  # This is a toolkit to upgrade your next Rails application
  # $ bundle_report outdated
  # $ bundle_report --help
  gem 'next_rails'

  # https://github.com/julianrubisch/attractor
  # A code complexity metrics visualization and exploration tool for Ruby and JavaScript
  # $ attractor report
  gem 'attractor'
  gem 'attractor-javascript'
  gem 'attractor-ruby'

  # https://github.com/danmayer/coverband
  # A gem to measure production code usage, showing a counter for the number of times each line of code is executed.
  # gem 'coverband'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]

  # https://github.com/thoughtbot/factory_bot_rails
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails'

  # https://github.com/rubocop/rubocop-factory_bot
  # factory_bot-specific analysis for your projects, as an extension to RuboCop.
  gem 'rubocop-factory_bot', require: false

  # https://github.com/minitest-reporters
  # Death to haphazard monkey-patching! Extend Minitest through simple hooks.
  gem 'minitest-reporters', require: false

  # #################
  # Integration tests
  # #################

  # https://github.com/teamcapybara/capybara
  # Capybara helps you test web applications by simulating how a real user would interact with your app
  gem 'capybara'

  # https://github.com/mattheworiordan/capybara-screenshot
  # Capture a screenshot for every test failure automatically!
  gem 'capybara-screenshot'

  # https://github.com/rubocop/rubocop-capybara
  gem 'rubocop-capybara', require: false

  # https://github.com/rubycdp/cuprite
  # Cuprite is a pure Ruby driver (read as no Selenium/WebDriver/ChromeDriver dependency) for Capybara
  gem 'cuprite'

  # https://github.com/vcr/vcr
  # Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic,
  # accurate tests.
  # gem 'vcr'

  # ##########
  # Unit tests
  # ##########

  # https://github.com/minitest/minitest-rails
  # Minitest integration for Rails 8.1
  gem 'minitest-rails'

  # https://github.com/simplecov-ruby/simplecov
  # Code coverage for Ruby
  gem 'simplecov', require: false

  # https://github.com/DatabaseCleaner/database_cleaner
  # Ensure a clean state during tests
  gem 'database_cleaner-active_record'

  # # https://github.com/bblimke/webmock
  # # Mock network requests and prevent outgoing requests from occuring in the test suite.
  # gem 'webmock'

  # https://github.com/alindeman/zonebie
  # Zonebie prevents bugs in code that deals with timezones by randomly assigning a zone on every run.
  gem 'zonebie'
end
