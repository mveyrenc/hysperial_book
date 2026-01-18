# frozen_string_literal: true

require 'test_helper'

class TagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
  end

  test 'should get search without any tag family' do
    ContentTagFamily.reindex

    get search_content_tag_families_url
    assert_response :success
  end

  test 'should get search with some tag families' do
    ContentTagFamily.reindex
    create_list(:content_tag_family, 3, created_by: @user, updated_by: @user)

    get search_content_tag_families_url
    assert_response :success
  end
end
