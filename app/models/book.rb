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
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum :kind, {
    cooking: 'cooking',
    care: 'care',
    fabric_art: 'fabric_art'
  }, suffix: true

  has_rich_text :short_description
  has_rich_text :description

  acts_as_list
end
