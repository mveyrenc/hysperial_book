# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should update book' do
    book = FactoryBot.create(:book)

    patch bookcase_book_url(book), params: { bookcase_book: { name: 'updated' } }

    assert_redirected_to bookcase_books_path
    # Reload association to fetch updated data and assert that title is updated.
    book.reload
    assert_equal 'updated', book.name
  end
end
