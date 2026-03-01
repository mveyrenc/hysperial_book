# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty book" do
    post bookcase_books_url, params: { bookcase_book: {
      name: '',
      kind: ''
    } }
    assert_response :unprocessable_content
  end

  test "shouldn't duplicate a book" do
    book = FactoryBot.create(:book)
    post bookcase_books_url, params: { bookcase_book: {
      name: book.name,
      kind: book.kind
    } }
    assert_response :unprocessable_content
  end

  test 'should create book' do
    assert_difference('Bookcase::Book.count', +1) do
      post bookcase_books_url, params: { bookcase_book: { name: Faker::Book.title, kind: :cooking } }
    end
    assert_redirected_to bookcase_book_path(Bookcase::Book.last)
  end
end
