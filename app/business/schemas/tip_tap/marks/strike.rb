# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-strike/src/strike.tsx

module Schemas
  module TipTap
    module Marks
      class Strike < Schemas::TipTap::Mark
        self.type_name = 'strike'

        self.html_tag = 's'
      end
    end
  end
end
