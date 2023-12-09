# frozen_string_literal: true

module Layout
  class NavbarComponent < ApplicationComponent
    def render?
      user_signed_in?
    end
  end
end
