# frozen_string_literal: true

module Media
  module Logics
    # List media in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern
      def call
        context.records = Medium.order(created_at: :desc)
      end
    end
  end
end
