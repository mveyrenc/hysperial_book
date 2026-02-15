# frozen_string_literal: true

require 'test_helper'

module TipTap
  class RegistryTest < ActiveSupport::TestCase
    setup do
      @json_contents = {
        type: "doc",
        content: [
          {
            type: "paragraph",
            content: [
              {
                type: "text",
                text: "Hello World!",
                marks: [
                  { type: "bold" },
                  { type: "italic" }
                ]
              }
            ]
          }
        ]
      }

      @complex_document = TipTap::Document.new do |doc|
        doc.heading(level: 2) { |heading| heading.text("Summary") }

        doc.paragraph do |paragraph|
          paragraph.text("Hello ")
          paragraph.text("World", marks: [{ type: "bold" }])
          paragraph.add_content(TipTap::Nodes::HardBreak.new)
          paragraph.text("Second line")
        end

        doc.bullet_list do |list|
          list.list_item do |item|
            item.paragraph { |para| para.text("First bullet") }
            item.ordered_list do |nested|
              nested.list_item { |li| li.paragraph { |para| para.text("Nested one") } }
            end
          end
          list.list_item { |item| item.paragraph { |para| para.text("Second bullet") } }
        end

        doc.task_list do |list|
          list.task_item(checked: true) { |item| item.paragraph { |para| para.text("Checked item") } }
          list.task_item { |item| item.paragraph { |para| para.text("Todo item") } }
        end

        doc.blockquote { |blockquote| blockquote.paragraph { |para| para.text("Quote") } }

        doc.codeblock { |block| block.code('puts "hi"') }

        doc.table do |table|
          table.table_row do |row|
            row.table_header { |cell| cell.paragraph { |para| para.text("Header One") } }
            row.table_header { |cell| cell.paragraph { |para| para.text("Header Two") } }
          end

          table.table_row do |row|
            row.table_cell { |cell| cell.paragraph { |para| para.text("Cell A") } }
            row.table_cell { |cell| cell.paragraph { |para| para.text("Cell B| with pipe") } }
          end
        end

        doc.image(src: "https://example.com/image.png")
        doc << TipTap::Nodes::HorizontalRule.new
      end

      @table = TipTap::Document.new do |d|
        d.table do |t|
          t.table_row do |r|
            r.table_header { |h| h.paragraph { |p| p.text "Header" } }
            r.table_cell { |c| c.paragraph { |p| p.text "Cell" } }
          end
        end
      end
    end

    describe "from_json" do
      it "when there is a JSON object, returns a document" do
        assert_instance_of TipTap::Document, TipTap::Document.from_json(@json_contents)
        assert_operator TipTap::Document.from_json(@json_contents).content.size, '>', 0
      end

      it "when JSON is nil, returns an empty document" do
        assert_instance_of TipTap::Document, TipTap::Document.from_json(nil)
        assert_empty TipTap::Document.from_json(nil).content
      end

      it "when JSON includes a non-registered node, skips the unregistered node" do
        json = {
          type: "doc",
          content: [
            {
              type: "paragraph",
              content: [
                {
                  type: "text",
                  text: "Hello World!",
                  marks: [
                    { type: "bold" },
                    { type: "italic" }
                  ]
                }
              ]
            },
            {
              type: "fake-node",
              content: [
                {
                  type: "text",
                  text: "Hello World!",
                  marks: [
                    { type: "bold" },
                    { type: "italic" }
                  ]
                }
              ]
            }
          ]
        }

        assert_raises TipTap::Registry::MissingNodeError do
          TipTap::Document.from_json(json)
        end
      end
    end

    describe "Enumerable" do
      it "iterates over the content for #each" do
        json = {
          type: "doc",
          content: [
            {
              type: "paragraph",
              content: [
                {
                  type: "text",
                  text: "Hello World!",
                  marks: [
                    { type: "bold" },
                    { type: "italic" }
                  ]
                }
              ]
            }
          ]
        }
        document = TipTap::Document.from_json(json)
        assert_equal document.map(&:class), [TipTap::Nodes::Paragraph]
      end
    end

    describe "find_node" do
      it "when passing a string, returns a node" do
        document = TipTap::Document.from_json(@json_contents)
        node = document.find_node(TipTap::Nodes::Paragraph.type_name)

        assert_instance_of TipTap::Nodes::Paragraph, node
        assert_equal "Hello World!", node.to_plain_text
      end

      it "when passing a class, returns a node" do
        document = TipTap::Document.from_json(@json_contents)
        node = document.find_node(TipTap::Nodes::Paragraph)

        assert_instance_of TipTap::Nodes::Paragraph, node
        assert_equal "Hello World!", node.to_plain_text
      end
    end

    describe "to_html" do
      it "returns an HTML string" do
        document = TipTap::Document.from_json(@json_contents)
        html = document.to_html

        assert_equal '<div class="content"><p><strong><em>Hello World!</em></strong></p></div>', html
      end
    end

    describe "to_markdown" do
      it "returns an HTML string" do
        document = TipTap::Document.new do |doc|
          doc.paragraph do |paragraph|
            paragraph.text("Bold", marks: [{ type: "bold" }])
            paragraph.text(" ")
            paragraph.text("Italic", marks: [{ type: "italic" }])
            paragraph.text(" ")
            paragraph.text("Strike", marks: [{ type: "strike" }])
            paragraph.text(" ")
            paragraph.text("Under", marks: [{ type: "underline" }])
            paragraph.text(" ")
            paragraph.text("Highlight", marks: [{ type: "highlight", attrs: { color: "#ffff00" } }])
            paragraph.text(" ")
            paragraph.text("Styled", marks: [{ type: "textStyle", attrs: { color: "#ff0000" } }])
            paragraph.text(" ")
            paragraph.text("Super", marks: [{ type: "superscript" }])
            paragraph.text(" ")
            paragraph.text("Sub", marks: [{ type: "subscript" }])
            paragraph.text(" ")
            paragraph.text("Link", marks: [{ type: "link", attrs: { href: "https://example.com", title: "Example" } }])
            paragraph.text(" ")
            paragraph.text("Inline code", marks: [{ type: "code" }])
          end
        end
        markdown = document.to_markdown
        assert_equal '**Bold** _Italic_ ~~Strike~~ <u>Under</u> <mark data-color="#ffff00" style="background-color:#ffff00;color:inherit;">Highlight</mark> <span style="color:#ff0000;">Styled</span> <sup>Super</sup> <sub>Sub</sub> [Link](https://example.com "Example") `Inline code`', markdown
      end

      it "renders inline marks as markdown" do
        markdown = @complex_document.to_markdown

        expected = <<~MARKDOWN.strip
          ## Summary

          Hello **World**  
          Second line

          - First bullet
            1. Nested one
          - Second bullet

          - [x] Checked item
          - [ ] Todo item

          > Quote

          ```
          puts "hi"
          ```

          | Header One | Header Two |
          | --- | --- |
          | Cell A | Cell B| with pipe |

          ![](https://example.com/image.png)

          ---
        MARKDOWN

        assert_equal expected, markdown
      end
    end

    describe "to_plain_text" do
      it "returns a plain text string" do
        document = TipTap::Document.from_json(@json_contents)
        text = document.to_plain_text

        assert_instance_of String, text
        assert_equal "Hello World!", text
      end
    end

    describe "to_h" do
      it "returns a Hash representation of the object" do
        document = TipTap::Document.from_json(@json_contents)
        json = document.to_h

        assert_equal({
                       type: "doc",
                       content: [
                         { type: "paragraph",
                           content: [
                             { type: "text",
                               text: "Hello World!",
                               marks: [
                                 { type: "bold" },
                                 { type: "italic" }
                               ] }
                           ] }
                       ]
                     }, json)
      end
    end

    describe "heading" do
      it "adds a heading node" do
        document = TipTap::Document.new do |document|
          document.heading { |h| h.text("Hello World!") }
        end

        assert_instance_of TipTap::Nodes::Heading, document.content.first
      end
    end

    describe "paragraph" do
      it "adds a paragraph node" do
        document = TipTap::Document.new do |document|
          document.paragraph { |p| p.text("Hello World!") }
        end

        assert_instance_of TipTap::Nodes::Paragraph, document.content.first
      end
    end

    describe "task_list" do
      it "adds a task list node" do
        document = TipTap::Document.new do |document|
          document.task_list do |tl|
            tl.task_item do |ti|
              ti.paragraph do |para|
                para.text("Hello World!")
              end
            end
          end
        end
        assert_instance_of TipTap::Nodes::TaskList, document.content.first
      end
    end

    describe "bullet_list" do
      it "adds a bullet list node" do
        document = TipTap::Document.new do |document|
          document.bullet_list do |bl|
            bl.list_item do |li|
              li.paragraph do |para|
                para.text("Hello World!")
              end
            end
          end
        end
        assert_instance_of TipTap::Nodes::BulletList, document.content.first
      end
    end

    describe "ordered_list" do
      it "adds a ordered list node" do
        document = TipTap::Document.new do |document|
          document.ordered_list do |ol|
            ol.list_item do |li|
              li.paragraph do |para|
                para.text("Hello World!")
              end
            end
          end
        end
        assert_instance_of TipTap::Nodes::OrderedList, document.content.first
      end
    end

    describe "blockquote" do
      it "adds a blockquote node" do
        document = TipTap::Document.new do |document|
          document.blockquote do |quote|
            quote.paragraph do |para|
              para.text("Hello World!")
            end
          end
        end
        assert_instance_of TipTap::Nodes::Blockquote, document.content.first
      end
    end

    describe "codeblock" do
      it "adds a codeblock node" do
        document = TipTap::Document.new do |document|
          document.codeblock do |codeblock|
            codeblock.code("Hello World!")
          end
        end
        assert_instance_of TipTap::Nodes::Codeblock, document.content.first
      end
    end

    describe "blank?" do
      it "when the document is NOT blank, returns false" do
        document = TipTap::Document.new do |document|
          document.paragraph { |p| p.text("Hello World!") }
        end
        assert_equal false, document.blank?
      end

      it "when the document is blank, returns true" do
        document = TipTap::Document.new.tap(&:paragraph)
        assert_equal true, document.blank?
      end
    end

    describe "#table" do
      it "adds a Table to the document" do
        assert_instance_of TipTap::Nodes::Table, @table.content.first
      end

      it "correctly structures table-related nodes" do
        table = @table.content.first
        assert_instance_of TipTap::Nodes::Table, table

        row = table.content.first
        assert_instance_of TipTap::Nodes::TableRow, row

        header = row.content.first
        assert_instance_of TipTap::Nodes::TableHeader, header
        assert_equal "Header", header.to_plain_text

        cell = row.content.last
        assert_instance_of TipTap::Nodes::TableCell, cell
        assert_equal "Cell", cell.to_plain_text
      end

      it "generates the correct hash structure for table nodes" do
        table_hash = @table.to_h[:content].first

        assert_equal "table", table_hash[:type]
        assert_equal "tableRow", table_hash[:content].first[:type]
        assert_equal ["tableHeader", "tableCell"], table_hash[:content].first[:content].map { |node| node[:type] }
      end
    end
  end
end