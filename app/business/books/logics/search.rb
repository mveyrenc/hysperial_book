# frozen_string_literal: true

module Books
  module Logics
    # List books in the admin panel
    class Search < ApplicationInteractor
      include PaginatedConcern
      include SearchConcern

      def set_model
        context.model = Book
      end

      def set_where
        return unless context.query.key? :kind and context.query[:kind] != ''

        context.records = context.records.where(kind: context.query[:kind])
      end

      def set_aggs
        context.records = context.records.aggs(kind: {})
      end

      def set_order
        context.records = context.records.order(position: :asc)
      end
    end
  end
end
