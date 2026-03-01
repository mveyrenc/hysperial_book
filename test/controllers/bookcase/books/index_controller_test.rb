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

  test 'should get index without any book' do
    get bookcase_books_url
    assert_response :success
  end

  test 'should get index with some books' do
    Bookcase::Book.search_index.refresh
    create_list(:book, 3, :reindex)

    get bookcase_books_url
    assert_response :success
  end
end
