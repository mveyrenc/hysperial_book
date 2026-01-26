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

  test 'should get book search without any content' do
    Bookcase::Content.reindex

    get search_bookcase_book_contents_path(@book)
    assert_response :success
  end

  test 'should get book search with some contents' do
    Bookcase::Content.reindex
    create_list(:content, 3, book: @book)

    get search_bookcase_book_contents_path(@book)
    assert_response :success
  end
end
