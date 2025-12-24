# frozen_string_literal: true

module ContentAttributes
  module Components
    module AttributeDisplay
      module AttributeBody
        # ContentAttributes display attribute body component
        class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
          include ActiveSupport::Inflector

          def call
            component = "ContentAttributes::Components::AttributeDisplay::#{classify(record.data_type)}::Component"

            if Object.const_defined?(component)
              render Kernel.const_get(component).new(record: record)
            else
              render ContentAttributes::Components::AttributeDisplay::Default::Component.new(record: record)
            end
          end
        end
      end
    end
  end
end
