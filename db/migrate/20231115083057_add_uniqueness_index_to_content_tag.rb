# frozen_string_literal: true

class AddUniquenessIndexToContentTag < ActiveRecord::Migration[7.1]
  def change
    add_index :content_tags, %i[value kind book_id], unique: true
  end
end
