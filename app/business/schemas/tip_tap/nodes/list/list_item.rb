# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/item/list-item.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class ListItem < Schemas::TipTap::Node
          self.type_name = 'listItem'

          self.html_tag = 'li'

          # rubocop:disable Metrics/AbcSize
          # rubocop:disable Metrics/PerceivedComplexity
          def from_dom_node(dom_node)
            check_dom_node_parameter(dom_node)

            if dom_node.name != self.class.html_tag
              raise WrongDomNodeParameterError, "#{dom_node.to_html} given, expecting '#{self.class.html_tag}'"
            end

            if dom_node.text?
              add_content Registry.text.add_text(dom_node.content)
            else
              init_content
              dom_node.children.each do |child|
                if child.name == BulletList.html_tag
                  add_content Registry.bullet_list.from_dom_node(child)
                elsif child.name == self.class.html_tag
                  add_content Registry.list_item.from_dom_node(child)
                elsif child.name == TipTap::Nodes::Paragraph.html_tag
                  add_content Registry.paragraph.from_dom_node(child)
                else
                  add_content Registry.text.from_dom_node(child)
                end
              end
            end

            itself
          end

          # rubocop:enable Metrics/AbcSize
          # rubocop:enable Metrics/PerceivedComplexity
        end
      end
    end
  end
end
