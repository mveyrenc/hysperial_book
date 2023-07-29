# frozen_string_literal: true

# Create book model
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :kind, null: false
      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end

    add_index :books, :kind, unique: true
  end
end
