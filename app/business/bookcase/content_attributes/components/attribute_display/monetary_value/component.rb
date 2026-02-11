# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module MonetaryValue
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            def render?
              record.data.any?
            end
          end
        end
      end
    end
  end
end
