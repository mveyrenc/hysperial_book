# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty tag family" do
    assert_difference('Bookcase::ContentTagFamily.count', 0) do
      post bookcase_content_tag_families_url, params: { bookcase_content_tag_family: {
        name: '',
        kind: '',
        book_id: ''
      } }
    end
    assert_response :redirect
  end

  test "shouldn't duplicate a tag family" do
    tag_family = FactoryBot.create(:content_tag_family)
    post bookcase_content_tag_families_url, params: { bookcase_content_tag_family: {
      name: tag_family.name,
      kind: tag_family.kind,
      book_id: tag_family.book.id
    } }
    assert_response :unprocessable_content
  end

  test 'should create tag family' do
    book = FactoryBot.create(:book)
    assert_difference('Bookcase::ContentTagFamily.count', +1) do
      post bookcase_content_tag_families_url, params: { bookcase_content_tag_family: { name: Faker::Book.title, kind: :cooking, book_id: book.id } }
    end
    assert_redirected_to bookcase_content_tag_families_path
  end
end
