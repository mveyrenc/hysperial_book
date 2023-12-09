# frozen_string_literal: true

# Application component
class ApplicationComponent < ViewComponent::Base
  delegate :current_user, :policy, 'user_signed_in?', to: :helpers
end
