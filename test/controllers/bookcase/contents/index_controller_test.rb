# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get index without any content' do
    Bookcase::Content.reindex

    get bookcase_contents_url
    assert_response :success
  end

  test 'should get index with some contents' do
    Bookcase::Content.reindex
    create_list(:content, 3)

    get bookcase_contents_url
    assert_response :success
  end
end
