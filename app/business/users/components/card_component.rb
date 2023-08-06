# frozen_string_literal: true

module Users
  module Components
    # Users card component
    class CardComponent < ApplicationComponent
      attr_reader :user

      delegate :email, :name, :role, to: :user, prefix: true

      def initialize(user:)
        @user = user

        super
      end
    end
  end
end
