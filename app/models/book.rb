# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id            :uuid             not null, primary key
#  kind          :enum             default("cooking"), not null
#  metadata      :jsonb            not null
#  position      :integer
#  settings      :jsonb            not null
#  slug          :string           not null
#  subtitle      :string
#  title         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_books_on_created_by_id  (created_by_id)
#  index_books_on_kind           (kind)
#  index_books_on_slug           (slug) UNIQUE
#  index_books_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
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

  ## Relations
  has_many :content_tag_families, -> { order(title: :asc) }

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  ## Act as
  acts_as_list

  ## Validations
  validates :title, presence: true
  validates :kind, presence: true

  def to_s
    title
  end
end
