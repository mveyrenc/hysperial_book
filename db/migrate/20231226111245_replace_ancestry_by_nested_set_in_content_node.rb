# frozen_string_literal: true

class ReplaceAncestryByNestedSetInContentNode < ActiveRecord::Migration[7.1]

  def self.up
    add_column :content_nodes, :parent_id, :uuid

    add_column :content_nodes, :lft, :uuid
    add_column :content_nodes, :rgt, :uuid

    # optional fields
    add_column :content_nodes, :depth, :integer
    change_column_null :content_nodes, :children_count, false, default: 0

    # This is necessary to update :lft and :rgt columns
    ContentNode.reset_column_information
    ContentNode.rebuild!
  end

  def self.down
    remove_column :content_nodes, :parent_id
    remove_column :content_nodes, :lft
    remove_column :content_nodes, :rgt

    # optional fields
    remove_column :content_nodes, :depth
    remove_column :content_nodes, :children_count

    add_column :content_nodes, :ancestry, :string, collation: 'C', null: false
    add_column :content_nodes, :ancestry_depth, :integer, default: 0
    add_index :content_nodes, :ancestry
  end
end
