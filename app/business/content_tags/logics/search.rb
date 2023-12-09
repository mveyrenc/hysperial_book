# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = ContentTag.joins(:book)
                                    .includes(:book)
                                    .order(Book.arel_table[:title].asc)
                                    .order(:kind)
                                    .order(:value)
      end
    end
  end
end
