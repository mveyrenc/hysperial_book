# frozen_string_literal: true

module Bookcase
  module Books
    module Interactors
      # List books in the admin panel
      class SearchInteractor < ApplicationInteractor
        include SearchConcern
        include PaginatedConcern

        def set_model
          context.model = Bookcase::Book
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
          context.search_query = context.search_query.order(
            [position: { order: :asc, unmapped_type: :integer }]
          )
        end

        def rearrange_aggs
          aggs = {}
          context.aggs.each do |k, agg|
            next unless agg.include?('buckets') && agg['buckets'].any?

            if k.eql?('kind')
              aggs[k] = {
                name: Bookcase::ContentTagFamily.human_attribute_name(:kind),
                multiple: false,
                position: 1,
                buckets: context.aggs['kind']['buckets'].map do |bkt|
                  ["#{Bookcase::Book.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            end
          end
          context.aggs = aggs.sort_by { |_k, v| v[:position] }
        end
      end
    end
  end
end
