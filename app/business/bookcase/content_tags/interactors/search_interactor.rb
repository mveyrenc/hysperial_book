# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Interactors
      # List tags in the admin panel
      class SearchInteractor < ApplicationInteractor
        include SearchConcern
        include PaginatedConcern

        def set_model
          context.model = Bookcase::ContentTag
        end

        def set_where
          %i[book_kind book_id content_tag_family_kind content_tag_family_id].each do |f|
            next unless context.query.include?(f) && context.query[f].present?

            context.search_query = if f == :book_id
                                     context.search_query.where("#{f}": Book.find_by(slug: context.query[f]).try(:id))
                                   elsif f == :content_tag_family_id
                                     context.search_query.where("#{f}": ContentTagFamily.find_by(slug: context.query[f]).try(:id))
                                   else
                                     context.search_query.where("#{f}": context.query[f])
                                   end
          end
        end

        def set_aggs
          context.search_query = context.search_query.aggs(
            book_kind: {}, book_id: {},
            content_tag_family_kind: {}, content_tag_family_id: {}
          )
        end

        def set_order
          context.search_query = context.search_query
                                        .includes(:content_tag_family)
                                        .order(:book_position)
                                        .order(:name)
        end

        def rearrange_aggs
          aggs = {}
          context.aggs.each do |k, agg|
            next unless agg.include?('buckets') && agg['buckets'].any?

            if k.eql?('book_kind')
              aggs[k] = {
                name: Bookcase::ContentTagFamily.human_attribute_name(:book_kind),
                multiple: false,
                position: 1,
                buckets: agg['buckets'].map do |bkt|
                  ["#{Bookcase::BookKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            elsif k.eql?('book_id')
              aggs[k] = {
                name: Bookcase::ContentTagFamily.human_attribute_name(:book),
                multiple: false,
                position: 2,
                buckets: agg['buckets'].map do |bkt|
                  b = Bookcase::Book.find_by(id: bkt['key'])
                  ["#{b.name} (#{bkt['doc_count']})", b.slug] if b.present?
                end
              }
            elsif k.eql?('content_tag_family_kind')
              aggs[k] = {
                name: Bookcase::ContentTag.human_attribute_name(:content_tag_family_kind),
                multiple: false,
                position: 3,
                buckets: agg['buckets'].map do |bkt|
                  ["#{Bookcase::ContentTagFamilyKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            elsif k.eql?('content_tag_family_id')
              aggs[k] = {
                name: Bookcase::ContentTag.human_attribute_name(:content_tag_family),
                multiple: false,
                position: 4,
                buckets: agg['buckets'].map do |bkt|
                  b = Bookcase::ContentTagFamily.find_by(id: bkt['key'])
                  ["#{b.name} (#{bkt['doc_count']})", b.slug] if b.present?
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
