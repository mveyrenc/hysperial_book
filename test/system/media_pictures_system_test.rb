# frozen_string_literal: true

require 'application_system_test_case'

class MediaPicturesSystemTest < ApplicationSystemTestCase
  test 'visit pictures list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit media_pictures_path
    assert_current_path media_pictures_path
  end
end
