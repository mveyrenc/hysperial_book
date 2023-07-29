# frozen_string_literal: true

module Users
  module ViewComponents
    # Users edit component
    class EditComponent < ApplicationComponent
      attr_reader :user

      def initialize(user:)
        @user = user

        super
      end
    end
  end
end
