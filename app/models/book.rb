# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  position   :integer
#  settings   :jsonb            not null
#  slug       :string
#  subtitle   :string
#  title      :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_books_on_slug  (slug) UNIQUE
#  index_books_on_type  (type) UNIQUE
#
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :kind, use: :slugged

  has_rich_text :short_description
  has_rich_text :description

  acts_as_list
end