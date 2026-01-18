# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty book" do
    post books_url, params: { book: {
      name: '',
      kind: ''
    } }
    assert_response :unprocessable_content
  end

  test "shouldn't duplicate a book" do
    book = FactoryBot.create(:book)
    post books_url, params: { book: {
      name: book.name,
      kind: book.kind
    } }
    assert_response :unprocessable_content
  end

  test 'should create book' do
    assert_difference('Book.count', +1) do
      post books_url, params: { book: { name: Faker::Book.title, kind: :cooking } }
    end
    assert_redirected_to books_path
  end
end
