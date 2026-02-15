# frozen_string_literal: true

require 'test_helper'
require 'tip_tap'

MyTestNode = Class.new(TipTap::Node)
MyTestMark = Class.new(TipTap::Mark)

module TipTap
  class RegistryTest < ActiveSupport::TestCase

    describe ".register" do
      it "registers a node" do
        TipTap::Registry.register("myNode", MyTestNode)
        assert_equal(TipTap::Registry.node_registry["myNode"], MyTestNode)
      end

      it "registers a mark" do
        TipTap::Registry.register("myMark", MyTestMark)
        assert_equal(TipTap::Registry.mark_registry["myMark"], MyTestMark)
      end
    end

    describe ".node_for" do
      it "returns the node for the given name" do
        TipTap::Registry.register("myNode", MyTestNode)
        assert_equal(TipTap::Registry.node_for("myNode"), MyTestNode)
      end

      it "raises an error if the node is not registered" do
        assert_raises TipTap::Registry::MissingNodeError do
          TipTap::Registry.node_for("someTestNode")
        end
      end
    end

    describe ".mark_for" do
      it "returns the mark for the given name" do
        TipTap::Registry.register("myMark", MyTestMark)
        assert_equal(TipTap::Registry.mark_for("myMark"), MyTestMark)
      end

      it "raises an error if the mark is not registered" do
        assert_raises TipTap::Registry::MissingMarkError do
          TipTap::Registry.mark_for("someTestMark")
        end
      end
    end
  end
end