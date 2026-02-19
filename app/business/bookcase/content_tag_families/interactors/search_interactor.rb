# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Interactors
      # List tags in the admin panel
      class SearchInteractor < ApplicationInteractor
        include SearchConcern
        include PaginatedConcern

        def set_model
          context.model = Bookcase::ContentTagFamily
        end

        def set_where
          %i[kind book_id book_kind].each do |f|
            next unless context.query.include?(f) && context.query[f].present?

            context.search_query = if f == :book_id
                                     context.search_query.where("#{f}": Book.find_by(slug: context.query[f]).try(:id))
                                   else
                                     context.search_query.where("#{f}": context.query[f])
                                   end
          end
        end

        def set_aggs
          context.search_query = context.search_query.aggs(kind: {}, book_kind: {}, book_id: {})
        end

        def set_order
          context.search_query = context.search_query
                                        .includes(:book)
                                        .order(
                                          [{ book_position: { order: :asc, unmapped_type: :integer },
                                             position: { order: :asc, unmapped_type: :integer } }]
                                        )
        end

        def rearrange_aggs
          aggs = []
          context.aggs.each do |k, agg|
            next unless agg.include?('buckets') && agg['buckets'].any?

            case k
            when 'kind'
              aggs << {
                key: k,
                name: Bookcase::ContentTagFamily.human_attribute_name(:kind),
                multiple: false,
                position: 1,
                buckets: context.aggs['kind']['buckets'].map do |bkt|
                  ["#{Bookcase::ContentTagFamilyKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})",
                   bkt['key']]
                end
              }
            when 'book_kind'
              aggs << {
                key: k,
                name: Bookcase::ContentTagFamily.human_attribute_name(:book_kind),
                multiple: false,
                position: 2,
                buckets: context.aggs['book_kind']['buckets'].map do |bkt|
                  ["#{Bookcase::BookKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            when 'book_id'
              # get all books in the bucket in one request
              bkt_books = Bookcase::Book.find(agg['buckets'].map { |bkt| bkt['key'] }).index_by(&:id)
              aggs << {
                key: k,
                name: Bookcase::ContentTagFamily.human_attribute_name(:book),
                multiple: false,
                position: 3,
                buckets: agg['buckets'].map do |bkt|
                  # replace book id by there name
                  b = bkt_books[bkt['key']]
                  ["#{b.name} (#{bkt['doc_count']})", b.slug] if b.present?
                end
              }
            end
          end
          context.aggs = aggs.sort_by { |e| e[:position] }
        end
      end
    end
  end
end
