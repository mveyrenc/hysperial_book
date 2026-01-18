# frozen_string_literal: true

require 'test_helper'
require_relative 'support/capybara'
require_relative 'support/system_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include SystemHelper

  before do
    Capybara.reset_sessions!
  end

  driven_by :my_cuprite

  register_spec_type(self) do |_desc, *addl|
    addl.include? :system
  end
end
