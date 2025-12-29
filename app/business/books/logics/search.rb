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
        %i[kind].each do |f|
          if context.query.include?(f) && context.query[f].present?
            context.records = context.records.where("#{f}": context.query[f])
          end
        end
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
