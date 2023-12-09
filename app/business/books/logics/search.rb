# frozen_string_literal: true

module Books
  module Logics
    # List books in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = Book.order(position: :asc)
      end
    end
  end
end
