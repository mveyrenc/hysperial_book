# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module Rate
          # ContentAttributes display rate kind component
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            def render?
              (record.data.present? && record.data.key?('value')) || super
            end
          end
        end
      end
    end
  end
end
