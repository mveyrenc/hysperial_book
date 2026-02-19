# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-table/src/cell/table-cell.ts

module Schemas
  module TipTap
    module Nodes
      module Table
        class TableCell < Schemas::TipTap::Node
          self.type_name = 'tableCell'

          self.html_tag = 'td'
        end
      end
    end
  end
end
