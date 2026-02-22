# frozen_string_literal: true

# Helpers for browser junk
module SystemHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    click_on I18n.t('devise.sessions.new.sign_in')
  end
end
