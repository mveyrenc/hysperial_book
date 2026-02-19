# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-table/src/header/table-header.ts

module Schemas
  module TipTap
    module Nodes
      module Table
        class TableHeader < Schemas::TipTap::Node
          self.type_name = 'tableHeader'

          self.html_tag = 'th'
        end
      end
    end
  end
end
