# frozen_string_literal: true

require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should update content' do
    tag_family = FactoryBot.create(:content)

    patch content_url(tag_family), params: { content: { name: 'updated' } }

    assert_redirected_to contents_path
    # Reload association to fetch updated data and assert that title is updated.
    tag_family.reload
    assert_equal 'updated', tag_family.name
  end
end
