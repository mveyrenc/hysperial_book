# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-table/src/table/table.ts

module Schemas
  module TipTap
    module Nodes
      module Table
        class Table < Schemas::TipTap::Node
          self.type_name = 'table'

          self.html_tag = 'table'
        end
      end
    end
  end
end
