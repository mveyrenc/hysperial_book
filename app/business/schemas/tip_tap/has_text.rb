# frozen_string_literal: true

module Schemas
  module TipTap
    module HasText
      def text
        @table.fetch(:text, [])
      end

      def init_text
        @table[:text] = []
      end

      def set_text(text)
        @table[:text] = text
        itself
      end
      alias text= set_text

      def is_text?
        @table.key?(:text)
      end

      def text_empty?
        !@table.key?(:text) || @table[:text].empty?
      end

      delegate :blank?, to: :text, prefix: true
    end
  end
end
