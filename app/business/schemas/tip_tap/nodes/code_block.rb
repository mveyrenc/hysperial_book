# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-code-block/src/code-block.ts

module Schemas
  module TipTap
    module Nodes
      class CodeBlock < Schemas::TipTap::Node
        self.type_name = 'codeBlock'

        self.html_tag = 'pre'
      end
    end
  end
end
