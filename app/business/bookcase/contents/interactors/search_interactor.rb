# frozen_string_literal: true

module Bookcase
  module Contents
    module Interactors
      # Search contents
      class SearchInteractor < ApplicationInteractor
        include SearchConcern
        include PaginatedConcern

        def set_model
          context.model = Bookcase::Content
        end

        def set_where
          %i[kind book_kind book_id content_tag_ids].each do |f|
            next unless context.query.include?(f) && context.query[f].present?

            context.search_query = if f == :book_id
                                     context.search_query.where("#{f}": Book.find_by(slug: context.query[f]).try(:id))
                                   elsif f == :content_tag_ids
                                     context.search_query.where("#{f}": ContentTag.find_by(slug: context.query[f]).select(:id))
                                   else
                                     context.search_query.where("#{f}": context.query[f])
                                   end
          end
        end

        def set_aggs
          aggs = [[:kind, {}]]
          if context.book.present?
            context.book.content_tag_families.where("settings->> 'aggregatable' = ?",
                                                    true.to_s).order(:position).each do |f|
              aggs << [ContentTagFamily.content_tags_index_id(f).to_sym, {}]
            end
          else
            aggs << [:book_kind, {}]
            aggs << [:book_id, {}]
          end
          context.search_query = context.search_query.aggs(aggs.to_h)
        end

        def set_order
          context.search_query = context.search_query
                                        .includes(:thumbnail, :book)
        end

        def rearrange_aggs
          aggs = {}
          context.aggs.each do |k, agg|
            next unless agg.include?('buckets') && agg['buckets'].any?

            if k.eql?('kind')
              aggs[k] = {
                key: :kind,
                name: Bookcase::Content.human_attribute_name(:kind),
                multiple: false,
                position: 1,
                buckets: agg['buckets'].map do |bkt|
                  ["#{Bookcase::ContentKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            elsif k.eql?('book_kind')
              aggs[k] = {
                key: :book_kind,
                name: Bookcase::Content.human_attribute_name(:book_kind),
                multiple: false,
                position: 2,
                buckets: agg['buckets'].map do |bkt|
                  ["#{Bookcase::BookKind.human_attribute_name(bkt['key'])} (#{bkt['doc_count']})", bkt['key']]
                end
              }
            elsif k.eql?('book_id')
              aggs[k] = {
                key: :book_id,
                name: Bookcase::Content.human_attribute_name(:book_id),
                multiple: false,
                position: 3,
                buckets: agg['buckets'].map do |bkt|
                  b = Bookcase::Book.find_by(id: bkt['key'])
                  ["#{b.name} (#{bkt['doc_count']})", b.slug]
                end
              }
            elsif k.start_with?('content_tags_id')
              f_id = k[16, 36]
              f = Bookcase::ContentTagFamily.find(f_id)
              aggs[k] = {
                key: :content_tags_ids,
                name: f.name,
                multiple: true,
                position: 4,
                buckets: agg['buckets'].map do |bkt|
                  t = Bookcase::ContentTag.find(bkt['key'])
                  ["#{t.name} (#{bkt['doc_count']})", t.slug]
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
