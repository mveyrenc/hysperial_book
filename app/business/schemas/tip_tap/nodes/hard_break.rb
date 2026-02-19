# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-hard-break/src/hard-break.ts

module Schemas
  module TipTap
    module Nodes
      class HardBreak < Schemas::TipTap::Node
        self.type_name = 'hardBreak'

        def to_html
          tag.br
        end

        def to_markdown(_context = Markdown::Context.root)
          "  \n"
        end
      end
    end
  end
end
