# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = ContentTag.includes(content_tag_family: :book)
                                    .order('book.position')
                                    .order('content_tag_family.title')
                                    .order(:name)
      end
    end
  end
end
