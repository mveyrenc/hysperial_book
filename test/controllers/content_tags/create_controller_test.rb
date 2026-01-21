# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test "shouldn't create an empty tag" do
    assert_difference('ContentTag.count', 0) do
      post content_tags_url, params: {
        content_tag: {
          name: '',
          content_tag_family_id: ''
        }
      }
    end
    assert_response :redirect
  end

  test "shouldn't duplicate a tag" do
    tag = FactoryBot.create(:content_tag)
    post content_tags_url, params: {
      content_tag: {
        name: tag.name,
        content_tag_family_id: tag.content_tag_family.id
      }
    }
    assert_response :unprocessable_content
  end

  test 'should create tag' do
    tag_family = FactoryBot.create(:content_tag_family)
    assert_difference('ContentTag.count', +1) do
      post content_tags_url, params: {
        content_tag: {
          name: Faker::Book.title,
          content_tag_family_id: tag_family.id
        }
      }
    end
    assert_redirected_to content_tags_path
  end
end
