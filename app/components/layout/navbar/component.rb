# frozen_string_literal: true

module Layout
  module Navbar
    class Component < ApplicationComponent
      def render?
        user_signed_in?
      end
    end
  end
end
