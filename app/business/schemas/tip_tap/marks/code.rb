# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-code/src/code.ts

module Schemas
  module TipTap
    module Marks
      class Code < Schemas::TipTap::Mark
        self.type_name = 'code'

        self.html_tag = 'code'
      end
    end
  end
end
