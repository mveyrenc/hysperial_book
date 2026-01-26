# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should update tag family' do
    tag_family = FactoryBot.create(:content_tag_family)

    patch bookcase_content_tag_family_url(tag_family), params: { bookcase_content_tag_family: { name: 'updated' } }

    assert_redirected_to bookcase_content_tag_families_path
    # Reload association to fetch updated data and assert that title is updated.
    tag_family.reload
    assert_equal 'updated', tag_family.name
  end
end
