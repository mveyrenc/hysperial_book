# frozen_string_literal: true

module Schemas
  module TipTap
    class Base < OpenStruct
      include HasAttrs
      include HasContent
      include HasMarks
      include HasText

      include Registerable
      include HtmlRenderable
      include PlainTextRenderable

      def self.from_json(json)
        new(json.to_h.deep_symbolize_keys)
      end

      def initialize(hash = nil)
        super
        @table[:type] = type_name unless @table.key?(:type)
        content_from_hash(@table[:content]) if @table.key?(:content)
        marks_from_hash(@table[:marks]) if @table.key?(:marks)
        yield self if block_given?
      end

      def empty?
        text_empty? && content_empty?
      end

      def blank?
        text_blank? && content_blank?
      end

      def to_h
        @table.deep_dup.deep_transform_values do |value|
          value.respond_to?(:to_h) ? value.to_h : value
        end.deep_stringify_keys
      end

      protected

      def content_from_hash(values)
        @table[:content] = values.map do |value|
          case value
          when String then Registry.node_for(value).from_json(type: value)
          when Node then value
          else Registry.node_for(value[:type]).from_json(value)
          end
        end
      end

      def marks_from_hash(values)
        @table[:marks] = values.map do |value|
          case value
          when String then Registry.mark_for(value).from_json(type: value)
          when Mark then value
          else Registry.mark_for(value[:type]).from_json(value)
          end
        end
      end
    end
  end
end
