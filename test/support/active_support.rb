# frozen_string_literal: true

# Convenience methods around config creation, and database cleaning
module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods # instead of fixtures

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end
