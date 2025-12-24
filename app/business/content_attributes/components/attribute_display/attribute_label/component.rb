# frozen_string_literal: true

module ContentAttributes
  module Components
    module AttributeDisplay
      module AttributeLabel
        # ContentAttributes display attribute label component
        class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
          delegate :name, to: :record, prefix: true
        end
      end
    end
  end
end
