# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    Searchkick.enable_callbacks
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
    Searchkick.disable_callbacks
  end

  test 'should get search without any book' do
    get search_bookcase_books_url
    assert_response :success
  end

  test 'should get search with some books' do
    create_list(:book, 3)
    Bookcase::Book.search_index.refresh

    get search_bookcase_books_url
    assert_response :success
  end
end
