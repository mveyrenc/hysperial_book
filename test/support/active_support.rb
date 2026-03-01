# frozen_string_literal: true

# Convenience methods around config creation, and database cleaning
module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods # instead of fixtures

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all

    parallelize_setup do |worker|
      Searchkick.index_suffix = worker

      # reindex models for parallel tests
      Bookcase::Book.reindex
      Bookcase::ContentTagFamily.reindex
      Bookcase::ContentTag.reindex
      Bookcase::Content.reindex
    end
  end
end

# reindex models for non-parallel tests
Bookcase::Book.reindex
Bookcase::ContentTagFamily.reindex
Bookcase::ContentTag.reindex
Bookcase::Content.reindex

# and disable callbacks
Searchkick.disable_callbacks
