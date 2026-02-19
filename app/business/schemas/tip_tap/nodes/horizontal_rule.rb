# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-horizontal-rule/src/horizontal-rule.ts

module Schemas
  module TipTap
    module Nodes
      class HorizontalRule < Schemas::TipTap::Node
        self.type_name = 'horizontalRule'

        def to_html
          tag.hr
        end

        def to_markdown(_context = Markdown::Context.root)
          '---'
        end
      end
    end
  end
end
