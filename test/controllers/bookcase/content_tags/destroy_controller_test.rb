# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should destroy tag' do
    tag = FactoryBot.create(:content_tag)
    assert_difference('Bookcase::ContentTag.count', -1) do
      delete bookcase_content_tag_url(tag)
    end
    assert_redirected_to bookcase_content_tags_path
  end
end
