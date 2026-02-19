# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-color/src/index.ts

module Schemas
  module TipTap
    module Marks
      class Color < Schemas::TipTap::Mark
        self.type_name = 'color'

        self.html_tag = 'span'
      end
    end
  end
end
