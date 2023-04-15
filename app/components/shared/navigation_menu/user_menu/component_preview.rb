# frozen_string_literal: true

module Shared::NavigationMenu::UserMenu

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::NavigationMenu::UserMenu::Component.new
    end

  end

end
