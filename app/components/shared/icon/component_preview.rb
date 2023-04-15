# frozen_string_literal: true

module Shared::Icon

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::Icon::Component.new("favorite")
    end

    # @param icon select [favorite, star, home]
    def default_icon(icon: "favorite")
      render_component Shared::Icon::Component.new(icon)
    end

  end

end
