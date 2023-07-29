# frozen_string_literal: true

module Books
  module ViewComponents
    # Books edit component
    class EditComponent < ApplicationComponent
      attr_reader :book

      def initialize(book:)
        @book = book

        super
      end
    end
  end
end
