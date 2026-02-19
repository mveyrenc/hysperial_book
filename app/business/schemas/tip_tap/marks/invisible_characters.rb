# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-invisible-characters/src/invisible-characters.ts

module Schemas
  module TipTap
    module Marks
      class InvisibleCharacters < Schemas::TipTap::Mark
        self.type_name = 'invisibleCharacters'

        self.html_tag = 'span'
      end
    end
  end
end
