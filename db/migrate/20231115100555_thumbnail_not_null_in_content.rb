# frozen_string_literal: true

class ThumbnailNotNullInContent < ActiveRecord::Migration[7.1]
  def up
    change_column :contents, :thumbnail_id, :uuid, null: false
  end

  def down
    change_column :contents, :thumbnail_id, :uuid, null: true
  end
end
