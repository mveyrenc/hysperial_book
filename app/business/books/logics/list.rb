# frozen_string_literal: true

module Books
  module Logics
    # List books in the admin panel
    class List < ApplicationInteractor
      def call
        context.records = Book.all.order(position: :asc)
      end
    end
  end
end
