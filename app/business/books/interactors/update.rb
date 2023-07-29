# frozen_string_literal: true

module Books
  module Interactors
    # Update a book and his role
    class Update < ApplicationInteractor
      def call
        update_attributes
      end

      def update_attributes
        context.fail!(message: 'update_book.failure') unless context.book.update(context.params)
      end
    end
  end
end
