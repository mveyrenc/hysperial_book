# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  kind       :string           not null
#  position   :integer
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
class AddPositionToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :position, :integer
  end
end
