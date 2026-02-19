# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-typography/src/typography.ts

module Schemas
  module TipTap
    module Marks
      class Typography < Schemas::TipTap::Mark
        self.type_name = 'typography'

        self.html_tag = 'span'
      end
    end
  end
end
