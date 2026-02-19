# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/bullet-list/bullet-list.ts

module Schemas
  module TipTap
    module Nodes
      module Description
        class Term < Schemas::TipTap::Node
          self.type_name = 'descriptionTerm'

          self.html_tag = 'dt'
        end
      end
    end
  end
end
