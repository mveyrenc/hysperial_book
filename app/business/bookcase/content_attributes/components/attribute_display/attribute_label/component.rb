# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module AttributeLabel
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            delegate :name, to: :record, prefix: true
          end
        end
      end
    end
  end
end
