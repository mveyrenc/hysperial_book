# frozen_string_literal: true

module Schemas
  module TipTap
    class Registry
      include ActiveSupport::Inflector

      class MethodMissingError < StandardError
      end

      @node_registry = {}
      @mark_registry = {}

      def self.register(name, klass)
        node_registry[name.to_s] = klass if klass <= Node
        mark_registry[name.to_s] = klass if klass <= Mark
      end

      def self.document
        Document.new
      end

      def self.text
        Nodes::Text.new
      end

      def self.method_missing(name, *_args, **_kwargs, &)
        if name.to_s.end_with?('_mark')
          search_for = name.to_s.delete_suffix('_mark').camelize.downcase_first
          return mark_for(search_for).new if has_mark? search_for

          raise MethodMissingError, "Mark #{search_for} not found for #{name}"
        end
        search_for = name.to_s.camelize.downcase_first
        return node_for(search_for).new if has_node? search_for

        raise MethodMissingError, "Node #{search_for} not found for #{name}"
      end

      def self.has_node?(name)
        node_registry.key?(name.to_s)
      end

      def self.node_for(name)
        node_registry.fetch(name.to_s, Node)
      end

      def self.has_mark?(name)
        mark_registry.key?(name.to_s)
      end

      def self.mark_for(name)
        mark_registry.fetch(name.to_s, Mark)
      end

      def self.clear
        @node_registry = {}
        @mark_registry = {}
      end

      def self.node_registry
        @node_registry ||= {}
      end

      def self.mark_registry
        @mark_registry ||= {}
      end
    end
  end
end
