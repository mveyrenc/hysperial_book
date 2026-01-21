# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty content" do
    assert_difference('Content.count', 0) do
      post contents_url, params: { content: {
        name: '',
        kind: '',
        book_id: ''
      } }
    end
    assert_response :redirect
  end

  test "shouldn't duplicate a content" do
    tag_family = FactoryBot.create(:content)
    post contents_url, params: { content: {
      name: tag_family.name,
      kind: tag_family.kind,
      book_id: tag_family.book.id
    } }
    assert_response :unprocessable_content
  end

  test 'should create tag_family' do
    book = FactoryBot.create(:book)
    assert_difference('Content.count', +1) do
      post contents_url, params: { content: { name: Faker::Book.title, kind: :cooking, book_id: book.id } }
    end
    assert_redirected_to contents_path
  end
end
