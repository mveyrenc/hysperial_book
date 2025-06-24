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
  ## FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  ## Enumerables
  enum :kind, BookKind.kinds, suffix: true

  def kind_name
    BookKind.human_attribute_name(kind)
  end

  ## Act as
  acts_as_list

  ## Validations
  validates :title, presence: true
  validates :kind, presence: true

  def to_s
    title
  end
end
