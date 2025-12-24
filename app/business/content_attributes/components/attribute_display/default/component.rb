# frozen_string_literal: true

module ContentAttributes
  module Components
    module AttributeDisplay
      module Default
        # ContentAttributes display text kind component
        class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
          delegate :data_type, to: :record, prefix: true
        end
      end
    end
  end
end
