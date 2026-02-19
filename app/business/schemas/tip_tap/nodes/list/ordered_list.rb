# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/ordered-list/ordered-list.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class OrderedList < Schemas::TipTap::Node
          self.type_name = 'orderedList'

          self.html_tag = 'ol'
        end
      end
    end
  end
end
