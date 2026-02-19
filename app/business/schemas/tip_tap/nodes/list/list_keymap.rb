# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/keymap/list-keymap.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class ListKeymap < Schemas::TipTap::Node
          self.type_name = 'listKeymap'
        end
      end
    end
  end
end
