# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-table/src/row/table-row.ts

module Schemas
  module TipTap
    module Nodes
      module Table
        class TableRow < Schemas::TipTap::Node
          self.type_name = 'tableRow'

          self.html_tag = 'tr'
        end
      end
    end
  end
end
