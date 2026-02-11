# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module Default
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            delegate :data_type, to: :record, prefix: true
          end
        end
      end
    end
  end
end
