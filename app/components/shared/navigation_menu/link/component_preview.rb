# frozen_string_literal: true

module Shared::NavigationMenu::Link

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::NavigationMenu::Link::Component.new(
        label: "Navigation menu link",
        path: '#',
        active: false
      )
    end

    def active_link
      render_component Shared::NavigationMenu::Link::Component.new(
        label: "Navigation menu link",
        path: '#',
        active: true
      )
    end

  end

end
