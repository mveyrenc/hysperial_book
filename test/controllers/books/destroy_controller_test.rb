# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should destroy book' do
    book = FactoryBot.create(:book)
    assert_difference('Book.count', -1) do
      delete book_url(book)
    end
    assert_redirected_to books_path
  end
end
