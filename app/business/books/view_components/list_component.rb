# frozen_string_literal: true

module Books
  module ViewComponents
    # Books list component
    class ListComponent < ApplicationComponent
      attr_reader :books

      # @param [Book] books
      def initialize(books:)
        @books = books

        super
      end
    end
  end
end
