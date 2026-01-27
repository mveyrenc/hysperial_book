# frozen_string_literal: true

module Layout
  module Navbar
    class Component < ApplicationComponent
      def render?
        user_signed_in?
      end

      def all_books
        Bookcase::Book.order(position: :asc)
      end
    end
  end
end
