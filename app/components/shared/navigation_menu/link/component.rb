# frozen_string_literal: true

module Shared::NavigationMenu::Link

  class Component < ApplicationViewComponent
    option :label
    option :path
    option :active, default: proc { false }

    def css_classes
      if @active
        ""
      else
        "opacity-50"
      end
    end
  end

end
