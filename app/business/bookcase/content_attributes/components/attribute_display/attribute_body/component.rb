# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        module AttributeBody
          class Component < ContentAttributes::Components::AttributeDisplay::BaseComponent
            include ActiveSupport::Inflector

            def call
              if record.respond_to?(:to_html)
                return record.send(to_html)
              end

              component_name = "Bookcase::ContentAttributes::Components::AttributeDisplay::#{classify(record.data_type)}::Component"
              if Object.const_defined?(component_name)
                component = Kernel.const_get(component_name).new(record)
                if component.render?
                  return render component
                end
              end

              component = Bookcase::ContentAttributes::Components::AttributeDisplay::HtmlText::Component.new(record)
              if component.render?
                return render component
              end

              component = Bookcase::ContentAttributes::Components::AttributeDisplay::PlainText::Component.new(record)
              if component.render?
                return render component

              end

              render Bookcase::ContentAttributes::Components::AttributeDisplay::Default::Component.new(record)
            end
          end
        end
      end
    end
  end
end
