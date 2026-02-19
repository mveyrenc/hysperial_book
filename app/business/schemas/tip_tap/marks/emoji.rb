# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-emoji/src/emoji.ts

module Schemas
  module TipTap
    module Marks
      class Emoji < Schemas::TipTap::Mark
        self.type_name = 'emoji'

        self.html_tag = 'span'
      end
    end
  end
end
