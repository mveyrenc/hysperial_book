# frozen_string_literal: true

module Books
  module Components
    # Books card component
    class CardComponent < ApplicationComponent
      attr_reader :book

      delegate :title, :subtitle, :kind, to: :book, prefix: true

      def initialize(book:)
        @book = book

        super
      end
    end
  end
end
