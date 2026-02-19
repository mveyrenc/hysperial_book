# frozen_string_literal: true

module Schemas
  module TipTap
    module PlainTextRenderable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def plain_text_separator=(separator)
          @plain_text_separator = separator
        end

        def plain_text_separator
          @plain_text_separator
        end
      end

      def to_plain_text
        return text if is_text?

        content.map(&:to_plain_text).join(self.class.plain_text_separator)
      end
    end
  end
end
