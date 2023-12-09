# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class Search < ApplicationInteractor
      include SearchConcern
      def call
        context.records = ContentTag.joins(:book).order(value: :asc)
      end
    end
  end
end
