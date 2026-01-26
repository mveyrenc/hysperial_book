# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get index without any tag' do
    Bookcase::ContentTag.reindex

    get bookcase_content_tags_url
    assert_response :success
  end

  test 'should get index with some tags' do
    Bookcase::ContentTag.reindex
    create_list(:content_tag, 3)

    get bookcase_content_tags_url
    assert_response :success
  end
end
