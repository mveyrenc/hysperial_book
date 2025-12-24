# frozen_string_literal: true

class CreateContentTagFamily < ActiveRecord::Migration[8.0]
  def change
    # create_enum :content_tag_family_kind,
    #             %w[ingredient season occasion category geographic_area restriction source author thematic]
    create_table :content_tag_families, id: :uuid do |t|
      t.string :slug, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :kind, null: false
      t.references :book, null: false, foreign_key: true, type: :uuid

      t.jsonb :metadata, null: false, default: {}

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
