# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get edit tag' do
    tag = FactoryBot.create(:content_tag)
    get edit_content_tag_path(tag)
    assert_response :success
  end
end
