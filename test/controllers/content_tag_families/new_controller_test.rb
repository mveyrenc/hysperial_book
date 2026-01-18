# frozen_string_literal: true

require 'test_helper'

class TagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should get new tag_family' do
    get new_content_tag_family_url
    assert_response :success
  end
end
