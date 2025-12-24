# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  kind       :enum             not null
#  position   :integer
#  settings   :jsonb            not null
#  slug       :string           not null
#  subtitle   :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_books_on_kind  (kind)
#  index_books_on_slug  (slug) UNIQUE
#
class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :name, null: false, comment: 'The name of the item'
      t.string :alternate_name, null: true, comment: 'An alias for the item'
      t.text :description, null: true, comment: 'A description of the item'
      t.string :slug, null: false, index: { unique: true }, comment: 'Human readable item identifier'
      t.string :kind, null: false, comment: 'The kind or type of the item'

      t.jsonb :settings, null: false, default: {}, comment: 'A hash to configure the item'

      t.integer :position, comment: 'The position of the item'

      t.jsonb :metadata, null: false, default: {}, comment: 'A hash to store some data about the item'

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
