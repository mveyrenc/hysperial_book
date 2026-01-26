# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get edit content' do
    tag_family = FactoryBot.create(:content)
    get edit_bookcase_content_path(tag_family)
    assert_response :success
  end
end
