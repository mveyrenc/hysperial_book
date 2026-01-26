# frozen_string_literal: true

require 'application_system_test_case'

class MediaDocumentsSystemTest < ApplicationSystemTestCase
  test 'visit documents list' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit bookcase_media_documents_path
    assert_current_path bookcase_media_documents_path
  end
end
