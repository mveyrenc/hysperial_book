# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-heading/src/heading.ts

module Schemas
  module TipTap
    module Nodes
      class Heading < Schemas::TipTap::Node
        self.type_name = 'heading'

        self.html_tag = proc { "h#{level + 1}" }
        self.html_class_name = proc { "title is-#{level + 1}" }

        def level
          attrs.fetch(:level, 1).to_i
        end

        def html_attributes
          uuid = SecureRandom.uuid
          {
            id: uuid,
            'data-toc-id': uuid
          }.merge(super)
        end
      end
    end
  end
end
