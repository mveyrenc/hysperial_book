# frozen_string_literal: true

module Contents
  module Logics
    # List contents in the admin panel
    # https://web-crunch.com/posts/turbo-charged-real-time-search-ruby-on-rails-7
    # https://github.com/ankane/searchkick
    class Search < ApplicationInteractor
      include PaginatedConcern
      include SearchConcern

      def set_model
        context.model = Content
      end

      def set_where
        %i[kind book_id book_kind book_name].each do |f|
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
                                 .includes(:thumbnail, :book)
      end
    end
  end
end
