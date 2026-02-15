# frozen_string_literal: true

require 'test_helper'

NodeSubclass = Class.new(TipTap::Node)
NodeSubclass.type_name = "nodeSubclass"
NodeSubclass.html_tag = :div
NodeSubclass.html_class_name = "node-subclass"

module TipTap
  class RegistryTest < ActiveSupport::TestCase
    describe "initialize" do
      it "sets the attrs" do
        node = TipTap::Node.new(checked: true)
        assert_equal node.attrs, { "checked" => true }
      end

      it "camelcases the keys" do
        node = TipTap::Node.new(image_id: 1)
        assert_equal node.attrs, { "imageId" => 1 }
      end
    end

    describe "type_name=" do
      it "sets the type_name" do
        my_node = Class.new(TipTap::Node)
        my_node.type_name = "my_node"
        my_node_2 = Class.new(TipTap::Node)
        my_node_2.type_name = "my_node_2"
        assert_equal my_node.type_name, "my_node"
        assert_equal my_node_2.type_name, "my_node_2"
      end

      it "registers the node" do
        my_node = Class.new(TipTap::Node)
        my_node.type_name = "my_node"
        my_node_2 = Class.new(TipTap::Node)
        my_node_2.type_name = "my_node_2"
        assert_equal TipTap::Registry.node_for("my_node"), my_node
        assert_equal TipTap::Registry.node_for("my_node_2"), my_node_2
      end
    end

    describe "to_html" do
      it "renders the html" do
        assert_equal(NodeSubclass.new.to_html, '<div class="node-subclass"></div>')
      end
    end

    describe "to_h" do
      it "when the node is a Node class, returns an only the content" do
        node = TipTap::Node.new
        assert_equal node.to_h, { type: nil, content: [] }
      end

      it "when the node is a subclass of Node, returns a Hash representation of the object" do
        klass = Class.new(TipTap::Node)
        klass.type_name = "myTestNode"
        node = klass.new(test: "test")
        assert_equal node.to_h, { type: 'myTestNode', content: [], attrs: { test: 'test' } }
      end
    end

    describe "from_json" do
      it "when the node is registered, returns a node" do
        node = TipTap::Node.from_json({ content: [{ type: "text", text: "Hello World!" }] })
        assert_instance_of TipTap::Node, node
      end

      it "when the node is not registered, raises an error" do
        assert_raises TipTap::Registry::MissingNodeError do
          TipTap::Node.from_json({ content: [{ type: "fake-type", text: "Hello World!" }] })
        end
      end
    end

    describe "to_plain_text" do
      it "returns a plain text string" do
        node = TipTap::Node.from_json({ content: [{ type: "text", text: "Hello World!" }] })
        text = node.to_plain_text

        assert_instance_of String, text
        assert_equal text, "Hello World!"
      end

      it "when the node has children, breaks up paragraphs with separator" do
        node = TipTap::Node.from_json({
                                        content: [
                                          { type: "paragraph", content: [type: "text", text: "Hello World!"] },
                                          { type: "paragraph", content: [type: "text", text: "How are you?"] }
                                        ]
                                      })
        text = node.to_plain_text(separator: "\n\n")

        assert_instance_of String, text
        assert_equal text, "Hello World!\n\nHow are you?"
      end

      it "when the node has children, does not break up links with separator" do
        node = TipTap::Node.from_json({
                                        content: [
                                          {
                                            type: "paragraph", content: [
                                            { type: "text", text: "Hello " },
                                            { type: "text", text: "World!", marks: [{ type: "link", attrs: { href: "https://example.com" } }] }
                                          ]
                                          },
                                          { type: "paragraph", content: [type: "text", text: "How are you?"] }
                                        ]
                                      })
        text = node.to_plain_text(separator: "\n\n")

        assert_instance_of String, text
        assert_equal text, "Hello World!\n\nHow are you?"
      end

      it "when the node has children, does not break up bold marks with separator" do
        node = TipTap::Node.from_json({
                                        content: [
                                          {
                                            type: "paragraph", content: [
                                            { type: "text", text: "Hello " },
                                            { type: "text", text: "World!", marks: [{ type: "bold" }] }
                                          ]
                                          },
                                          { type: "paragraph", content: [type: "text", text: "How are you?"] }
                                        ]
                                      })
        text = node.to_plain_text(separator: "\n\n")

        assert_instance_of String, text
        assert_equal text, "Hello World!\n\nHow are you?"
      end
    end
  end
end