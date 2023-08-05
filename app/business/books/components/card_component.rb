# frozen_string_literal: true

module Books
  module Components
    # Books card component
    class CardComponent < ApplicationComponent
      attr_reader :book

      def initialize(book:)
        @book = book

        super
      end
    end
  end
end