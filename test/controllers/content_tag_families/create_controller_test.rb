# frozen_string_literal: true

require 'test_helper'

class TagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty tag family" do
    assert_difference('ContentTagFamily.count', 0) do
      post content_tag_families_url, params: { content_tag_family: {
        name: '',
        kind: '',
        book_id: ''
      } }
    end
    assert_response :redirect
  end

  test "shouldn't duplicate a tag family" do
    tag_family = FactoryBot.create(:content_tag_family)
    post content_tag_families_url, params: { content_tag_family: {
      name: tag_family.name,
      kind: tag_family.kind,
      book_id: tag_family.book.id
    } }
    assert_response :unprocessable_content
  end

  test 'should create tag_family' do
    book = FactoryBot.create(:book)
    assert_difference('ContentTagFamily.count', +1) do
      post content_tag_families_url, params: { content_tag_family: { name: Faker::Book.title, kind: :cooking, book_id: book.id } }
    end
    assert_redirected_to content_tag_families_path
  end
end
