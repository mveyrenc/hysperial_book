# frozen_string_literal: true

module Shared::HtmlContentField

  class ComponentPreview < ApplicationViewComponentPreview

    def default
      render_component Shared::HtmlContentField::Component.new(
        text: "<p>Some text</p>"
      )
    end

    # @param color select [gray, slate, zinc, neutral, stone]
    def content_gray(color: :gray)
      render_component Shared::HtmlContentField::Component.new(
        text: "<p>Some text</p>",
        color: color
      )
    end

  end

end
