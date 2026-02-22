# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should get search without any book' do
    Bookcase::Book.reindex

    get search_bookcase_books_url
    assert_response :success
  end

  test 'should get search with some books' do
    Bookcase::Book.reindex
    create_list(:book, 3)

    get search_bookcase_books_url
    assert_response :success
  end
end
