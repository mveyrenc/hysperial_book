# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-italic/src/italic.tsx

module Schemas
  module TipTap
    module Marks
      class Italic < Schemas::TipTap::Mark
        self.type_name = 'italic'

        self.html_tag = 'em'
      end
    end
  end
end
