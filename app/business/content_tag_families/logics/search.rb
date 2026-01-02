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
                                      .order(:book_position)
                                      .order(:position)
      end

      def rearrange_aggs
        aggs = {}
        context.aggs.each do |k, agg|
          next unless agg.include?('buckets') && agg['buckets'].any?

          case k
          when 'kind'
            aggs[k] = {
              key: :kind,
              name: ContentTagFamily.human_attribute_name(:kind),
              multiple: false,
              buckets: context.aggs['kind']['buckets'].map do |agg|
                ["#{ContentTagFamilyKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
              end
            }
          when 'book_kind'
            aggs[k] = {
              key: :book_kind,
              name: ContentTagFamily.human_attribute_name(:book_kind),
              multiple: false,
              buckets: context.aggs['book_kind']['buckets'].map do |agg|
                ["#{BookKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
              end
            }
          when 'book_id'
            aggs[k] = {
              key: :book_id,
              name: ContentTagFamily.human_attribute_name(:book_id),
              multiple: false,
              buckets: context.aggs['book_id']['buckets'].map do |agg|
                b = Book.find(agg['key'])
                ["#{b.name} (#{agg['doc_count']})", b.slug]
              end
            }
          end
        end
        context.aggs = aggs
      end
    end
  end
end
