# frozen_string_literal: true

module ContentTags
  module Logics
    # List tags in the admin panel
    class List < ApplicationInteractor
      def call
        context.records = ContentTag.joins(:book).order(value: :asc)
      end
    end
  end
end
