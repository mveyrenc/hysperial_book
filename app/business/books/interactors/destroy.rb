# frozen_string_literal: true

module Books
  module Interactors
    # Destroy a user
    class Destroy < ApplicationInteractor
      def call
        context.book.destroy
      end
    end
  end
end
