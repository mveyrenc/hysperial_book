# frozen_string_literal: true

module ContentAttributes
  module Components
    module AttributeDisplay
      # ContentAttributes display component
      class Component < ApplicationComponent
        attr_reader :record

        def initialize(record:)
          @record = record

          super
        end

        def attribute_label_renderer
          @attribute_label_renderer ||= AttributeLabel::Component.new(record: @record)
        end

        def attribute_body_renderer
          @attribute_body_renderer ||= AttributeBody::Component.new(record: @record)
        end
      end
    end
  end
end
