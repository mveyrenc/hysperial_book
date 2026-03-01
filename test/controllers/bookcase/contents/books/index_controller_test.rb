# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Bookcase::Content.search_index.delete if Bookcase::Content.search_index.exists?
    Bookcase::Content.reindex
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
    @book = FactoryBot.create(:book)
  end

  test 'should get book index without any content' do
    get bookcase_book_contents_path(@book)
    assert_response :success
  end

  test 'should get book index with some contents' do
    create_list(:content, 3, book: @book)

    get bookcase_contents_url
    assert_response :success
  end
end
