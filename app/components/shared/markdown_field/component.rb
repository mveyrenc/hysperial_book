# frozen_string_literal: true

module Shared::MarkdownField

  class Component < ApplicationViewComponent

    require 'redcarpet'

    def initialize(text:, color: 'gray', wrapper_class: nil)
      @text = text
      @color = color
      @wrapper_class = wrapper_class
      @markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::XHTML,
        autolink: true,
        tables: true,
        footnotes: true,
        strikethrough: true,
        space_after_headers: true,
        underline: true,
        quote: true
      )
    end

    def render?
      !text.blank?
    end

    def call
      content_tag :article, class: "#{prose_color} max-w-none #{wrapper_class}" do
        raw(@markdown.render(text))
      end
    end

    private

    attr_reader :text
    attr_reader :wrapper_class

    def prose_color
      if @color == 'gray' or @color == ''
        "prose"
      else
        "prose-#{@color}"
      end
    end
  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
