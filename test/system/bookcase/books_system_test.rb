# frozen_string_literal: true

require 'application_system_test_case'

class BooksSystemTest < ApplicationSystemTestCase
  test 'visit books list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit bookcase_books_path
    assert_current_path bookcase_books_path
  end
end
