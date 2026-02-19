# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/task-item/task-item.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class TaskItem < Schemas::TipTap::Node
          self.type_name = 'taskItem'

          self.html_tag = 'li'
        end
      end
    end
  end
end
