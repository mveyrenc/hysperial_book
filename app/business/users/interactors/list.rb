# frozen_string_literal: true

module Users
  module Interactors
    # List users in the admin panel
    class List < ApplicationInteractor
      def call
        context.list = User.all.order(:email)
      end
    end
  end
end
