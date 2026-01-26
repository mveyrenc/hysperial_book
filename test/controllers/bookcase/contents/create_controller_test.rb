# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty content" do
    assert_difference('Bookcase::Content.count', 0) do
      post bookcase_contents_url, params: { bookcase_content: {
        name: '',
        kind: '',
        book_id: ''
      } }
    end
    assert_response :redirect
  end

  test "shouldn't duplicate a content" do
    tag_family = FactoryBot.create(:content)
    post bookcase_contents_url, params: { bookcase_content: {
      name: tag_family.name,
      kind: tag_family.kind,
      book_id: tag_family.book.id
    } }
    assert_response :unprocessable_content
  end

  test 'should create tag_family' do
    book = FactoryBot.create(:book)
    assert_difference('Bookcase::Content.count', +1) do
      post bookcase_contents_url, params: { bookcase_content: { name: Faker::Book.title, kind: :cooking, book_id: book.id } }
    end
    assert_redirected_to bookcase_contents_path
  end
end
