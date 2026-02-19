# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-highlight/src/highlight.ts

module Schemas
  module TipTap
    module Nodes
      class Highlight < Schemas::TipTap::Node
        self.type_name = 'highlight'
      end
    end
  end
end
