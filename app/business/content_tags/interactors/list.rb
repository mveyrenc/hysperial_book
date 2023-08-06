# frozen_string_literal: true

module ContentTags
  module Interactors
    # List tags in the admin panel
    class List < ApplicationInteractor
      def call
        context.records = ContentTag.joins(:book).order(value: :asc)
      end
    end
  end
end
