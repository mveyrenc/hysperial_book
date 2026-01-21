# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should destroy content' do
    tag_family = FactoryBot.create(:content)
    assert_difference('Content.count', -1) do
      delete content_url(tag_family)
    end
    assert_redirected_to contents_path
  end
end
