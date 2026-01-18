# frozen_string_literal: true

# Checks for pending migration and applies them before tests are run.
ActiveRecord::Migration.maintain_test_schema!

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.allow_production = false
DatabaseCleaner.allow_remote_database_url = true
