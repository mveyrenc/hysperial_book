# frozen_string_literal: true

module Books
  module Decorators
    class RecordDecorator < ApplicationDecorator
      delegate :position

      def name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:name)
          context[:highlights][:name].html_safe
        else
          object.name
        end
      end

      def alternate_names(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:alternate_names)
          context[:highlights][:alternate_names].html_safe
        else
          object.alternate_names
        end
      end

      def description(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:description)
          context[:highlights][:description].html_safe
        else
          object.description
        end
      end

      def kind_name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:kind_name)
          context[:highlights][:kind_name].html_safe
        else
          BookKind.human_attribute_name(object.kind)
        end
      end
    end
  end
end
