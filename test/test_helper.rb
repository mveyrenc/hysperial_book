# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = "true"
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'

require_relative 'support/active_record'
require_relative 'support/active_support'
require_relative 'support/integration_test'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start :rails do
    enable_coverage :branch
    add_group 'Components', 'app/components'
    add_group 'Interactors', 'app/interactors'
    add_group 'Business', 'app/business'
    add_group 'Business/Book', 'app/business/books'
    add_group 'Business/Tag family', 'app/business/content_tag_families'
    add_group 'Business/Tag', 'app/business/content_tags'
    add_group 'Business/Contents', 'app/business/contents'
    add_group 'Business/Attributes', 'app/business/content_attributes'
  end
  puts 'required simplecov'
end

# https://github.com/alindeman/zonebie
Zonebie.set_random_timezone

module ActionDispatch
  class IntegrationTest
    setup do
      DatabaseCleaner.start
      Searchkick.enable_callbacks
    end

    teardown do
      Searchkick.disable_callbacks
      DatabaseCleaner.clean # cleanup of the test
    end
  end
end
