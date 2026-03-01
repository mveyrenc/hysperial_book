# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Searchkick.enable_callbacks
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
    Searchkick.disable_callbacks
  end

  test 'should get search without any content' do
    get search_bookcase_contents_url
    assert_response :success
  end

  test 'should get search with some contents' do
    create_list(:content, 3)
    Bookcase::ContentTagFamily.search_index.refresh

    get search_bookcase_contents_url
    assert_response :success
  end
end
