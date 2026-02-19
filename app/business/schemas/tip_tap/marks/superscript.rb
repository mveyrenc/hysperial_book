# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-superscript/src/superscript.tsx

module Schemas
  module TipTap
    module Marks
      class Superscript < Schemas::TipTap::Mark
        self.type_name = 'superscript'

        self.html_tag = 'sup'
      end
    end
  end
end
