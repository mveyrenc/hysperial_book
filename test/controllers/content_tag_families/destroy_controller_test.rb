# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should destroy tag family' do
    tag_family = FactoryBot.create(:content_tag_family)
    assert_difference('ContentTagFamily.count', -1) do
      delete content_tag_family_url(tag_family)
    end
    assert_redirected_to content_tag_families_path
  end
end
