# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  kind       :string           not null
#  settings   :jsonb            not null
#  subtitle   :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_books_on_slug  (slug) UNIQUE
#
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :kind, null: false
      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end
  end
end
