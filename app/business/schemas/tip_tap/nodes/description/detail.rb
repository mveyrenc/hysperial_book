# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/bullet-list/bullet-list.ts

module Schemas
  module TipTap
    module Nodes
      module Description
        class Detail < Schemas::TipTap::Node
          self.type_name = 'descriptionDetail'

          self.html_tag = 'dd'
        end
      end
    end
  end
end
