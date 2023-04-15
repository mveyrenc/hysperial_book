# frozen_string_literal: true

module Shared::NavigationMenu::ApplicationMenu

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::NavigationMenu::ApplicationMenu::Component.new
    end

  end

end
