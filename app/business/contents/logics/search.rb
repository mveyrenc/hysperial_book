# frozen_string_literal: true

module Contents
  module Logics
    # List contents in the admin panel
    # https://web-crunch.com/posts/turbo-charged-real-time-search-ruby-on-rails-7
    # https://github.com/ankane/searchkick
    class Search < ApplicationInteractor
      include SearchConcern

      def call
        context.records = Content.left_joins(:thumbnail).includes(:thumbnail).order(:created_at)
      end
    end
  end
end
