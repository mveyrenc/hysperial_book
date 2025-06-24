# frozen_string_literal: true

class CreateContentTagFamily < ActiveRecord::Migration[8.0]

  def change
    create_enum :content_tag_family_kind, %w[ingredient season occasion category geographic_area restriction source author thematic]
    create_table :content_tag_families, id: :uuid do |t|
      t.enum :kind, enum_type: :content_tag_family_kind, default: :category, null: false, index: true
      t.references :book, null: false, foreign_key: true, type: :uuid

      t.string :slug, null: false, index: { unique: true }
      t.string :title, null: false

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
