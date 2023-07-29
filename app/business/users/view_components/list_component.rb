# frozen_string_literal: true

module Users
  module ViewComponents
    # Users list component
    class ListComponent < ViewComponent::Base
      attr_reader :users

      # @param [User] users
      def initialize(users:)
        @users = users

        super
      end
    end
  end
end
