# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get search without any book' do
    Book.reindex

    get search_books_url
    assert_response :success
  end

  test 'should get search with some books' do
    Book.reindex
    create_list(:book, 3, created_by: @user, updated_by: @user)

    get search_books_url
    assert_response :success
  end
end
