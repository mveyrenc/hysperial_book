# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tag_families
#
#  id            :uuid             not null, primary key
#  kind          :enum             default("category"), not null
#  metadata      :jsonb            not null
#  slug          :string           not null
#  title         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_content_tag_families_on_book_id        (book_id)
#  index_content_tag_families_on_created_by_id  (created_by_id)
#  index_content_tag_families_on_kind           (kind)
#  index_content_tag_families_on_slug           (slug) UNIQUE
#  index_content_tag_families_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentTagFamily < ApplicationRecord
  belongs_to :book

  ## Enumerables
  enum :kind, ContentTagFamilyKind.kinds, suffix: true

  def kind_name
    ContentTagFamilyKind.human_attribute_name(kind)
  end

  ## FriendlyId
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged

  def generate_custom_slug
    [%i[kind title]]
  end

  ## Relations
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  ## Validations
  validates :title, presence: true
  validates :kind, presence: true

  def to_s
    title
  end
end
