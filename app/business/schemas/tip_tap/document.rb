# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-document/src/document.ts

module Schemas
  module TipTap
    class Document < Node
      self.html_tag = 'div'
      self.html_class_name = 'content'
    end
  end
end
