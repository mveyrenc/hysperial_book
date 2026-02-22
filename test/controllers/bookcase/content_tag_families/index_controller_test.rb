# frozen_string_literal: true

require 'test_helper'

class ContentTagFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, :super_admin)
    sign_in(@user, scope: :user)
  end

  test 'should get index without any tag family' do
    Bookcase::ContentTagFamily.reindex

    get bookcase_content_tag_families_url
    assert_response :success
  end

  test 'should get index with some tag families' do
    Bookcase::ContentTagFamily.reindex
    create_list(:content_tag_family, 3)

    get bookcase_content_tag_families_url
    assert_response :success
  end
end
