# frozen_string_literal: true

module Bookcase
  module Media
    module Interactors
      # List media in the admin panel
      class SearchInteractor < ApplicationInteractor
        include PaginatedConcern

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
end
