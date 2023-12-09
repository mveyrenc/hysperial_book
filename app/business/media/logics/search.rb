# frozen_string_literal: true

module Media
  module Logics
    # List media in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      before :set_model

      def call
        context.records = context.model
                                 .order(created_at: :desc)
      end

      def set_model
        context.model = context.model || Medium
      end
    end
  end
end
