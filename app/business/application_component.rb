# frozen_string_literal: true

# Application component
class ApplicationComponent < ViewComponent::Base

  delegate :current_user, :policy, to: :helpers

end
