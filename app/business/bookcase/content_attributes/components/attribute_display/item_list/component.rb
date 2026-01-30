# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module ItemList
          # ContentAttributes display item list kind component
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
