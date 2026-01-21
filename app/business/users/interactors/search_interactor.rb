# frozen_string_literal: true

module Users
  module Interactors
    # List users in the admin panel
    class SearchInteractor < ApplicationInteractor
      include SearchConcern
      include PaginatedConcern

      def set_model
        context.model = User
      end
    end
  end
end
