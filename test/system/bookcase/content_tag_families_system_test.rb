# frozen_string_literal: true

require 'application_system_test_case'

class ContentTagFamiliesSystemTest < ApplicationSystemTestCase
  test 'visit tag families list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit bookcase_content_tag_families_path
    assert_current_path bookcase_content_tag_families_path
  end
end
