# frozen_string_literal: true

module Users
  module Logics
    # List users in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern
      def call
        context.records = User.order(:email)
      end
    end
  end
end
