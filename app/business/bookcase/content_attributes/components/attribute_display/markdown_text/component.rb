# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module MarkdownText
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            delegate :markdown_text, to: :record, prefix: true

            def render?
              record_markdown_text.present?
            end

            def markdown
              Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
            end

          end
        end
      end
    end
  end
end
