# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-blockquote/src/blockquote.tsx

module Schemas
  module TipTap
    module Nodes
      class Blockquote < Schemas::TipTap::Node
        self.type_name = 'blockquote'

        self.html_tag = :blockquote
        self.html_class_name = 'blockquote'
      end
    end
  end
end
