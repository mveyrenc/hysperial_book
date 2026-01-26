# frozen_string_literal: true

require 'application_system_test_case'

class ContentsSystemTest < ApplicationSystemTestCase
  test 'visit contents list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit bookcase_contents_path
    assert_current_path bookcase_contents_path
  end
end
