# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should be forbidden if not signed in' do
    get root_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'should get index' do
    user = create(:user, :super_admin)
    sign_in user, scope: :user
    get root_url
    assert_response :success
  end
end
