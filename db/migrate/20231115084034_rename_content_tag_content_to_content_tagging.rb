# frozen_string_literal: true

class RenameContentTagContentToContentTagging < ActiveRecord::Migration[7.1]
  def change
    rename_table :content_tags_contents, :content_taggings
  end
end
