# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        module MarkdownText
          class Component < ContentAttributes::Components::Form::BaseComponent
            delegate :markdown_text, to: :record, prefix: true

            def markdown
              Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
            end

          end
        end
      end
    end
  end
end
