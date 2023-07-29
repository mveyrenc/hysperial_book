# frozen_string_literal: true

module Books
  module Interactors
    # List books in the admin panel
    class List < ApplicationInteractor
      def call
        context.list = Book.all.order(position: :asc)
      end
    end
  end
end
