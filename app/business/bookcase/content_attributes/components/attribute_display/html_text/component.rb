# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module HtmlText
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            delegate :html_text, to: :record, prefix: true

            def render?
              record_html_text.present?
            end
          end
        end
      end
    end
  end
end
