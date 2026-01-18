# frozen_string_literal: true

require 'application_system_test_case'

class DeviseAuthSystemTest < ApplicationSystemTestCase
  test 'sign in mandatory' do
    visit root_path
    assert_button I18n.t('devise.sessions.new.sign_in')
  end

  test 'sign in existing user' do
    user = FactoryBot.create(:user)
    sign_in(user)

    visit root_path
    assert_current_path root_path
    assert_text 'Hello !'
  end
end
