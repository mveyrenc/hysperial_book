# frozen_string_literal: true

require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  describe 'node registry' do
    it 'add nodes to registry' do
      assert_operator Schemas::TipTap::Registry.node_registry.size, '>', 0
    end

    it 'get node from registry if exists' do
      node = Schemas::TipTap::Registry.node_for('paragraph')
      assert_equal Schemas::TipTap::Nodes::Paragraph, node
    end

    it "get standard node from registry if doesn't exist" do
      node = Schemas::TipTap::Registry.node_for('foobar')
      assert_equal Schemas::TipTap::Node, node
    end

    it 'define creator method for existing nodes' do
      document = Schemas::TipTap::Registry.document.add_content do
        Schemas::TipTap::Registry.paragraph.add_content do
          Schemas::TipTap::Registry.text.set_text('Hello world!')
        end
      end
      assert_equal 'Hello world!', document.to_plain_text
    end
  end
end
