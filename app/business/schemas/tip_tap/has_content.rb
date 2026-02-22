# frozen_string_literal: true

module Schemas
  module TipTap
    module HasContent
      def content
        @table.fetch(:content, [])
      end

      def init_content
        @table[:content] = []
      end

      def add_content(node = nil)
        init_content if @table[:content].nil?
        if block_given?
          @table[:content] << yield
        elsif node.is_a? Node
          @table[:content] << node
        else
          raise OptionParser::MissingArgument, "#{node.class} given, expecting Node or block"
        end
        itself
      end

      alias << add_content

      delegate :size, to: :content

      def each(&)
        content.each(&)
      end

      def block?
        @table.key?(:content)
      end

      def content_empty?
        !@table.key?(:content) || @table[:content].empty?
      end

      def content_blank?
        content.all?(&:blank?)
      end

      def find_node(type_class_or_name)
        node_type = type_class_or_name.is_a?(String) ? Registry.node_for(type_class_or_name) : type_class_or_name
        n = content.find { |child| child.is_a?(node_type) }
        return n if n.present?

        content.find { |child| child.find_node(node_type) }
      end
    end
  end
end
