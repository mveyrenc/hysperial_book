# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include PaginatedConcern
      include SearchConcern

      def set_model
        context.model = ContentTag
      end

      def set_where
        %i[content_tag_family_kind content_tag_family_name book_kind book_name].each do |f|
          if context.query.include?(f) && context.query[f].present?
            context.records = context.records.where("#{f}": context.query[f])
          end
        end
      end

      def set_aggs
        context.records = context.records.aggs(content_tag_family_kind: {}, content_tag_family_name: {}, book_kind: {}, book_name: {})
      end

      def set_order
        context.records = context.records
                                 .includes(:content_tag_family, :book)
                                 .order(:book_position)
                                 .order(:name)
      end
    end
  end
end
