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

      def self.respond_to_missing?(name, _include_private = false)
        return includes_mark? missing_mark_name(name) if name.to_s.end_with?('_mark')
        includes_node? missing_node_name(name)
      end

      def self.method_missing(name, *_args, **_kwargs, &)
        return unless respond_to_missing?(name)

        if name.to_s.end_with?('_mark')
          return mark_for(missing_mark_name(name)).new
        end
        node_for(missing_node_name(name)).new
      end

      def self.missing_mark_name(name)
        name.to_s.delete_suffix('_mark').camelize.downcase_first
      end

      def self.missing_node_name(name)
        name.to_s.camelize.downcase_first
      end

      def self.includes_node?(name)
        node_registry.key?(name.to_s)
      end

      def self.node_for(name)
        node_registry.fetch(name.to_s, Node)
      end

      def self.includes_mark?(name)
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
