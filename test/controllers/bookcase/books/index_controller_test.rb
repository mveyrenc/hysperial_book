# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get index without any book' do
    Bookcase::Book.reindex

    get bookcase_books_url
    assert_response :success
  end

  test 'should get index with some books' do
    Bookcase::Book.reindex
    create_list(:book, 3)

    get bookcase_books_url
    assert_response :success
  end
end
