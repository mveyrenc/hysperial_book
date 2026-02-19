# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-paragraph/src/paragraph.tsx

module Schemas
  module TipTap
    module Nodes
      class Paragraph < Schemas::TipTap::Node
        self.type_name = 'paragraph'

        self.html_tag = 'p'

        self.plain_text_separator = ''
      end
    end
  end
end
