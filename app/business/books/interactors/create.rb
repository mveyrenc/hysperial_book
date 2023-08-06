# frozen_string_literal: true

module Books
  module Interactors
    # Update a book
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        context.book.attributes = context.params

        if context.book.save
          context.success!
        else
          context.fail!(message: 'create_book.failure')
        end
      end
    end
  end
end
