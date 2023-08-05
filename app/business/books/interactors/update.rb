# frozen_string_literal: true

module Books
  module Interactors
    # Update a book
    class Update < ApplicationInteractor
      def call
        update_from_params
      end

      def update_from_params
        context.fail!(message: 'update_book.failure') unless context.book.update(context.params)
      end
    end
  end
end
