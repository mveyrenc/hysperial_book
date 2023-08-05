# frozen_string_literal: true

module Books
  module Components
    # Books card component
    class FormComponent < ApplicationComponent
      delegate :rich_text_area_tag, to: :helpers

      attr_reader :book

      def initialize(book:)
        @book = book

        super
      end
    end
  end
end
