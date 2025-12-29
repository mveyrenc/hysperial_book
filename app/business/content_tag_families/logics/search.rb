# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include PaginatedConcern
      include SearchConcern

      def set_model
        context.model = ContentTagFamily
      end

      def set_where
        %i[kind book_name book_kind].each do |f|
          if context.query.include?(f) && context.query[f].present?
            context.records = context.records.where("#{f}": context.query[f])
          end
        end
      end

      def set_aggs
        context.records = context.records.aggs(kind: {}, book_kind: {}, book_name: {})
      end

      def set_order
        context.records = context.records
                                 .includes(:book)
                                 .order(:book_position)
                                 .order(:name)
      end
    end
  end
end
