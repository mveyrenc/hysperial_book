# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should get search without any content' do
    Bookcase::Content.reindex

    get search_bookcase_contents_url
    assert_response :success
  end

  test 'should get search with some contents' do
    Bookcase::Content.reindex
    create_list(:content, 3)

    get search_bookcase_contents_url
    assert_response :success
  end
end
