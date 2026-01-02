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
            context.search_query = context.search_query.where("#{f}": context.query[f])
          end
        end
      end

      def set_aggs
        context.search_query = context.search_query.aggs(kind: {})
      end

      def set_order
        context.search_query = context.search_query.order(position: :asc)
      end

      def rearrange_aggs
        context.aggs = if context.aggs.include?('kind') && context.aggs['kind'].include?('buckets')
                         [
                           {
                             key: :kind,
                             name: Book.human_attribute_name(:kind),
                             multiple: false,
                             buckets: context.aggs['kind']['buckets'].map do |agg|
                               ["#{BookKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
                             end
                           }
                         ]
                       else
                         []
                       end
      end
    end
  end
end
