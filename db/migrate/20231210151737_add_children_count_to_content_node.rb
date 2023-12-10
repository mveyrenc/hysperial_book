# frozen_string_literal: true

class AddChildrenCountToContentNode < ActiveRecord::Migration[7.1]
  def change
    change_table(:content_nodes) do |t|
      t.integer :children_count, default: 0
    end
  end
end
