# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-table-of-contents/src/tableOfContents.tsx

module Schemas
  module TipTap
    module Nodes
      class TableOfContents < Schemas::TipTap::Node
        self.type_name = 'tableOfContents'
      end
    end
  end
end
