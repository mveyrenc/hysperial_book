# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-text-style/src/background-color/background-color.ts

module Schemas
  module TipTap
    module Marks
      class BackgroundColor < Schemas::TipTap::Mark
        self.type_name = 'backgroundColor'

        self.html_tag = 'span'
      end
    end
  end
end
