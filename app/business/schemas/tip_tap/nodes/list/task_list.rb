# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/task-list/task-list.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class TaskList < Schemas::TipTap::Node
          self.type_name = 'taskList'

          self.html_tag = 'ul'
        end
      end
    end
  end
end
