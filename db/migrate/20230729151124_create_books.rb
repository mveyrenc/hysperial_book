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
    create_enum :book_kind, %w[cooking care fabric_art]
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :slug, null: false, index: { unique: true }

      t.enum :kind, enum_type: :book_kind, default: :cooking, null: false, index: true

      t.integer :position

      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end
  end
end
