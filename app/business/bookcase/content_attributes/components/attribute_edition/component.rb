# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeEdition
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super
            @record = record
          end

          def attribute_label_renderer
            @attribute_label_renderer ||= Bookcase::ContentAttributes::Components::AttributeDisplay::AttributeLabel::Component.new(@record)
          end

          def attribute_body_renderer
            @attribute_body_renderer ||= Bookcase::ContentAttributes::Components::AttributeDisplay::AttributeBody::Component.new(@record)
          end
        end
      end
    end
  end
end
