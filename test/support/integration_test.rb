# frozen_string_literal: true

# Used by controller tests
module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end
