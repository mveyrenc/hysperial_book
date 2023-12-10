# frozen_string_literal: true

class AddDepthCacheToContentNode < ActiveRecord::Migration[7.1]
  def change
    change_table(:content_nodes) do |t|
      t.integer :ancestry_depth, default: 0
    end
  end
end
