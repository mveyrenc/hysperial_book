# frozen_string_literal: true

module Shared::NavigationMenu

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::NavigationMenu::Component.new
    end

  end

end
