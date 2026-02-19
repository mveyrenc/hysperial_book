# frozen_string_literal: true

# https://github.com/ueberdosis/tiptap/blob/develop/packages/extension-list/src/bullet-list/bullet-list.ts

module Schemas
  module TipTap
    module Nodes
      module List
        class BulletList < Schemas::TipTap::Node
          self.type_name = 'bulletList'

          self.html_tag = 'ul'

          def from_dom_node(dom_node)
            check_dom_node_parameter(dom_node)

            if dom_node.name != self.class.html_tag
              raise WrongDomNodeParameterError, "#{dom_node.to_html} given, expecting '#{self.class.html_tag}'"
            end

            init_content
            dom_node.children.each do |child|
              if child.name == self.class.html_tag
                add_content Registry.bullet_list.from_dom_node(child)
              elsif child.name == ListItem.html_tag
                add_content Registry.list_item.from_dom_node(child)
              else
                raise WrongDomNodeParameterError, "unexpected tag #{dom_node.to_html}"
              end
            end

            itself
          end
        end
      end
    end
  end
end
