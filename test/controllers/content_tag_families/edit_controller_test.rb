# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get edit tag family' do
    tag_family = FactoryBot.create(:content_tag_family)
    get edit_content_tag_family_path(tag_family)
    assert_response :success
  end
end
