# frozen_string_literal: true

module Schemas
  module TipTap
    module DomParser
      class NoDomParsingError < StandardError
      end

      class WrongDomNodeParameterError < StandardError
      end

      def self.from_dom_node(dom_node, parent = nil)
        if dom_node.is_a? String
          dom_node = Nokogiri::HTML.fragment(dom_node.delete("\r\n"))
          parent = Registry.document
          parent.init_content
          dom_node.children.each do |child|
            from_dom_node(child, parent)
          end
          return parent
        end
        check_dom_node_parameter(dom_node)
        if parent.nil?
          parent = Registry.document
          parent.init_content
        end

        if dom_node.text? || %w[strong code em a s sub sup span u].include?(dom_node.name)
          parent.add_content from_text_node(dom_node)
        else
          if dom_node.name == 'br'
            parent.add_content Registry.hard_break
            return parent
          elsif dom_node.name == 'ul'
            new_parent = Registry.bullet_list
          elsif dom_node.name == 'ol'
            new_parent = Registry.ordered_list
          elsif dom_node.name == 'li'
            new_parent = Registry.list_item
          elsif dom_node.name == 'p'
            new_parent = Registry.paragraph
          elsif dom_node.name == 'table'
            new_parent = Registry.table
          elsif dom_node.name == 'tr'
            new_parent = Registry.tableRow
          elsif dom_node.name == 'th'
            new_parent = Registry.tableHeader
          elsif dom_node.name == 'td'
            new_parent = Registry.tableCell
          elsif %w[div tbody thead].include? dom_node.name
            new_parent = parent
          else
            raise WrongDomNodeParameterError, "unexpected tag #{dom_node.to_html}"
          end
          if new_parent != parent
            new_parent.init_content
            parent.add_content new_parent
          end
          dom_node.children.each do |child|
            from_dom_node(child, new_parent)
          end
        end
        parent
      end

      def self.from_text_node(dom_node, text_node = nil)
        text_node = Registry.text if text_node.nil?
        return text_node.set_text(dom_node.content) if dom_node.text?

        text_node.add_mark mark_from_dom_node(dom_node)
        dom_node.children.each do |child|
          from_text_node(child, text_node)
        end
        text_node
      end

      def self.mark_from_dom_node(dom_node)
        case dom_node.name
        when 'strong'
          Registry.bold_mark
        when 'code'
          Registry.code_mark
        when 'em'
          Registry.italic_mark
        when 'a'
          Registry.link_mark
        when 's'
          Registry.strike_mark
        when 'sub'
          Registry.subscript_mark
        when 'sup'
          Registry.superscript_mark
        when 'span'
          Registry.typography_mark
        when 'u'
          Registry.underline_mark
        else
          raise WrongDomNodeParameterError, "'#{dom_node.to_html}' given, expecting text node mark"
        end
      end

      def self.check_dom_node_parameter(dom_node)
        return if dom_node.is_a? Nokogiri::XML::Node

        raise WrongDomNodeParameterError, "dom_node instance of #{dom_node.class}, Nokogiri::XML::Node expected"
      end
    end
  end
end
