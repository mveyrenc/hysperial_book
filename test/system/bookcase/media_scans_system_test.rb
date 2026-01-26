# frozen_string_literal: true

require 'application_system_test_case'

class MediaScansSystemTest < ApplicationSystemTestCase
  test 'visit scans list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit media_scans_path
    assert_current_path media_scans_path
  end
end
