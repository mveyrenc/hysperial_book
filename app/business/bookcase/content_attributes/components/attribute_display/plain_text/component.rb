# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module PlainText
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            delegate :plain_text, to: :record, prefix: true

            def render?
              record_plain_text.present?
            end
          end
        end
      end
    end
  end
end
