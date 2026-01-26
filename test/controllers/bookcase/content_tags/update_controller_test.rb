# frozen_string_literal: true

require 'test_helper'

class ContentTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should update tag' do
    tag = FactoryBot.create(:content_tag)

    patch bookcase_content_tag_url(tag), params: { bookcase_content_tag: { name: 'updated' } }

    assert_redirected_to bookcase_content_tags_path
    # Reload association to fetch updated data and assert that title is updated.
    tag.reload
    assert_equal 'updated', tag.name
  end
end
