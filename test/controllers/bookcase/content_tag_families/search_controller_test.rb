# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Searchkick.enable_callbacks
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  teardown do
    Searchkick.disable_callbacks
  end

  test 'should get search without any tag family' do
    get search_bookcase_content_tag_families_url
    assert_response :success
  end

  test 'should get search with some tag families' do
    create_list(:content_tag_family, 3)
    Bookcase::ContentTag.search_index.refresh

    get search_bookcase_content_tag_families_url
    assert_response :success
  end
end
