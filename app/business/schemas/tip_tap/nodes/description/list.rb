# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/bullet-list/bullet-list.ts

module Schemas
  module TipTap
    module Nodes
      module Description
        class List < Schemas::TipTap::Node
          self.type_name = 'descriptionList'

          self.html_tag = 'dl'
        end
      end
    end
  end
end
