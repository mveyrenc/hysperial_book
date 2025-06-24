# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = ContentTag.joins(:content_tag_family)
                                    .includes(:content_tag_family)
                                    .order(ContentTagFamily.arel_table[:kind].asc)
                                    .order(ContentTagFamily.arel_table[:title].asc)
                                    .order(:title)
      end
    end
  end
end
