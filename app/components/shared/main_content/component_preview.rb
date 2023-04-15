# frozen_string_literal: true

module Shared::MainContent

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::MainContent::Component.new().with_content(content_tag :div, "Hello world!")
    end

  end

end
