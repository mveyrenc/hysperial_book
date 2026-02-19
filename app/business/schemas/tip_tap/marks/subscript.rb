# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-subscript/src/subscript.tsx

module Schemas
  module TipTap
    module Marks
      class Subscript < Schemas::TipTap::Mark
        self.type_name = 'subscript'

        self.html_tag = 'sub'
      end
    end
  end
end
