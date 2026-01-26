# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get edit book' do
    book = FactoryBot.create(:book)
    get edit_bookcase_book_path(book)
    assert_response :success
  end
end
