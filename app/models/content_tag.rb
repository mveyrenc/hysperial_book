# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tags
#
#  id            :uuid             not null, primary key
#  kind          :enum             not null
#  slug          :string           not null
#  value         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_content_tags_on_book_id                     (book_id)
#  index_content_tags_on_created_by_id               (created_by_id)
#  index_content_tags_on_kind                        (kind)
#  index_content_tags_on_slug                        (slug) UNIQUE
#  index_content_tags_on_updated_by_id               (updated_by_id)
#  index_content_tags_on_value_and_kind_and_book_id  (value,kind,book_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentTag < ApplicationRecord
  ## delegate
  delegate :title, to: :book, prefix: true

  ## FriendlyId
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged

  def generate_custom_slug
    [%i[book_title kind value]]
  end

  ## Enumerables
  enum kind: ContentTagKind.kinds, _suffix: true

  def kind_name
    ContentTagKind.human_attribute_name(kind)
  end

  ## Relations
  belongs_to :book
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_many :relater_akin_content_tags,
           class_name: 'AkinContentTag',
           foreign_key: :relater_id,
           inverse_of: :relater,
           dependent: :destroy
  has_many :relater_content_tags,
           through: :relater_akin_content_tags,
           source: :relater,
           dependent: :destroy
  has_many :related_akin_content_tags,
           class_name: 'AkinContentTag',
           foreign_key: :related_id,
           inverse_of: :related,
           dependent: :destroy
  has_many :related_content_tags,
           through: :related_akin_content_tags,
           source: :related

  has_many :content_taggings, dependent: :destroy
  has_many :contents, through: :content_taggings, dependent: :nullify

  ## Validations
  validates :kind, presence: true
  validates :value, presence: true, uniqueness: { scope: %i[kind book] }
end
