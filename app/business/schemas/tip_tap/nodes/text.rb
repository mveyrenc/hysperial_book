# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-text/src/text.ts

module Schemas
  module TipTap
    module Nodes
      class Text < Schemas::TipTap::Node
        self.type_name = 'text'
      end
    end
  end
end
