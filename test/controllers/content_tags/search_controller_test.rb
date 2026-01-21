# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get search without any tag' do
    ContentTag.reindex

    get search_content_tags_url
    assert_response :success
  end

  test 'should get search with some tags' do
    ContentTag.reindex
    create_list(:content_tag, 3)

    get search_content_tags_url
    assert_response :success
  end
end
