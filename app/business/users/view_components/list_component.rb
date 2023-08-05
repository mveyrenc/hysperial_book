# frozen_string_literal: true

module Users
  module ViewComponents
    # Users list component
    class ListComponent < ApplicationComponent
      attr_reader :users

      # @param [User] users
      def initialize(users:)
        @users = users

        super
      end
    end
  end
end