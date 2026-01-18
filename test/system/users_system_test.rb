# frozen_string_literal: true

require 'application_system_test_case'

class UsersSystemTest < ApplicationSystemTestCase
  test 'visit users list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit users_path
    assert_current_path users_path
  end
end
