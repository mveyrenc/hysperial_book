# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Bookcase::ContentTag.search_index.delete if Bookcase::ContentTag.search_index.exists?
    Bookcase::ContentTag.reindex
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should get search without any tag' do
    get search_bookcase_content_tags_url
    assert_response :success
  end

  test 'should get search with some tags' do
    create_list(:content_tag, 3)

    get search_bookcase_content_tags_url
    assert_response :success
  end
end
