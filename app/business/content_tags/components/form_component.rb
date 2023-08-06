# frozen_string_literal: true

module ContentTags
  module Components
    # ContentTags card component
    class FormComponent < ApplicationComponent
      delegate :book, :kind, to: :record, prefix: true

      attr_reader :record

      def initialize(record:)
        @record = record

        super
      end

      protected

      def book_select_values
        Book.all.order(position: :asc)
      end
    end
  end
end
