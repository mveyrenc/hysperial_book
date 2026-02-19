# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-bold/src/bold.tsx

module Schemas
  module TipTap
    module Marks
      class Bold < Schemas::TipTap::Mark
        self.type_name = 'bold'

        self.html_tag = 'strong'
      end
    end
  end
end
