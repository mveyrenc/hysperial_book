# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-link/src/link.tsx

module Schemas
  module TipTap
    module Marks
      class Link < Schemas::TipTap::Mark
        self.type_name = 'link'

        self.html_tag = 'a'
      end
    end
  end
end
