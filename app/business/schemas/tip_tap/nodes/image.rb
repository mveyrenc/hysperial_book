# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-image/src/image.ts

module Schemas
  module TipTap
    module Nodes
      class Image < Schemas::TipTap::Node
        self.type_name = 'image'

        self.html_tag = :figure

        def to_html
          image_tag(src, alt: alt)
        end

        def to_markdown(_context = Markdown::Context.root)
          return '' if src.blank?

          alt_text = alt.to_s
          escaped_alt = alt_text.gsub('[', '\\[').gsub(']', '\\]')
          escaped_src = src.to_s.gsub('(', '\\(').gsub(')', '\\)')
          "![#{escaped_alt}](#{escaped_src})"
        end

        def alt
          attrs.fetch(:alt, nil)
        end

        def src
          attrs.fetch(:src)
        end
      end
    end
  end
end
