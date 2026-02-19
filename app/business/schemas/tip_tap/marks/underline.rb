# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-underline/src/underline.ts

module Schemas
  module TipTap
    module Marks
      class Underline < Schemas::TipTap::Mark
        self.type_name = 'underline'

        self.html_tag = 'u'
      end
    end
  end
end
