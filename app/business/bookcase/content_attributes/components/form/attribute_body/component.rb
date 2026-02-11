# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        module AttributeBody
          class Component < ContentAttributes::Components::Form::BaseComponent
            include ActiveSupport::Inflector

            def call
              component_name = "Bookcase::ContentAttributes::Components::Form::#{classify(record.data_type)}::Component"
              if Object.const_defined?(component_name)
                component = Kernel.const_get(component_name).new(record, f)
                if component.render?
                  return render component
                end
              end

              component = Bookcase::ContentAttributes::Components::Form::HtmlText::Component.new(record, f)
              if component.render?
                return render component
              end

              component = Bookcase::ContentAttributes::Components::Form::MarkdownText::Component.new(record, f)
              if component.render?
                return render component
              end

              component = Bookcase::ContentAttributes::Components::Form::PlainText::Component.new(record, f)
              if component.render?
                return render component

              end

              render Bookcase::ContentAttributes::Components::Form::Default::Component.new(record, f)
            end
          end
        end
      end
    end
  end
end
