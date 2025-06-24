# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = ContentTagFamily.includes(:book)
                                          .order('book.position')
                                          .order(:title)
      end
    end
  end
end
