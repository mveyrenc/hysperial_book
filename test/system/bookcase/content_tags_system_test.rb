# frozen_string_literal: true

require 'application_system_test_case'

class ContentTagsSystemTest < ApplicationSystemTestCase
  test 'visit tags list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit bookcase_content_tags_path
    assert_current_path bookcase_content_tags_path
  end
end
