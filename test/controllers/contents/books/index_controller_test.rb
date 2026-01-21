# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
    @book = FactoryBot.create(:book)
  end

  teardown do
  end

  test 'should get book index without any content' do
    Content.reindex

    get book_contents_path(@book)
    assert_response :success
  end

  test 'should get book index with some contents' do
    Content.reindex
    create_list(:content, 3, book: @book)

    get contents_url
    assert_response :success
  end
end
