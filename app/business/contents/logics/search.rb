# frozen_string_literal: true

module Contents
  module Logics
    # List contents in the admin panel
    # https://web-crunch.com/posts/turbo-charged-real-time-search-ruby-on-rails-7
    # https://github.com/ankane/searchkick
    class Search < ApplicationInteractor
      before :set_page
      before :set_per_page

      def call
        context.records = Content.left_joins(:thumbnail).includes(:thumbnail).order(:created_at).page(context.page).per(context.per_page)
      end

      private

      def set_page
        context.page = context.page || 1
      end

      def set_per_page
        context.per_page = context.page || 25
      end
    end
  end
end
