# frozen_string_literal: true

module Users
  module Components
    # Users card component
    class CardComponent < ViewComponent::Base
      delegate :current_user, :policy, to: :helpers

      attr_reader :user

      def initialize(user:)
        @user = user

        super
      end
    end
  end
end
