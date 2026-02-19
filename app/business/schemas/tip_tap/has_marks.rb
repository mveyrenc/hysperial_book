# frozen_string_literal: true

module Schemas
  module TipTap
    module HasMarks
      def marks
        @table.fetch(:marks, [])
      end

      def add_mark(mark)
        @table[:marks] = [] if @table[:marks].nil?
        @table[:marks] << mark unless mark.nil?
        itself
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def match_dom_node_type?(type)
          html_tag == type
        end
      end
    end
  end
end
