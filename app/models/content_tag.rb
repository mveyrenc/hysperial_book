# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tags
#
#  id                                                         :uuid             not null, primary key
#  alternate_names(Aliases for the item)                      :text
#  data(A hash to store the data of the item)                 :jsonb            not null
#  description(A description of the item)                     :text
#  metadata(A hash to store some data about the item)         :jsonb            not null
#  name(The name of the item)                                 :string           not null
#  settings(A hash to configure the item)                     :jsonb            not null
#  slug(Human readable item identifier)                       :string           not null
#  created_at                                                 :datetime         not null
#  updated_at                                                 :datetime         not null
#  content_tag_family_id(The family to which the tag belongs) :uuid             not null
#  created_by_id                                              :uuid             not null
#  updated_by_id                                              :uuid             not null
#
# Indexes
#
#  index_content_tags_on_content_tag_family_id           (content_tag_family_id)
#  index_content_tags_on_created_by_id                   (created_by_id)
#  index_content_tags_on_name_and_content_tag_family_id  (name,content_tag_family_id) UNIQUE
#  index_content_tags_on_slug                            (slug) UNIQUE
#  index_content_tags_on_updated_by_id                   (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_tag_family_id => content_tag_families.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentTag < ApplicationRecord
  self.implicit_order_column = 'created_at'

  ## Searchkick
  searchkick highlight: %i[name content_tag_family_name book_name]

  def search_data
    attributes.merge(
      content_tag_family_name: content_tag_family.name,
      content_tag_family_kind: content_tag_family.kind,
      book_id: book.id,
      book_name: book.name,
      book_kind: book.kind,
      book_position: book.position
    )
  end

  def content_search_data
    [
      [ContentTagFamily.content_tags_index_id(content_tag_family), [id]],
      [ContentTagFamily.content_tags_index_name(content_tag_family), [name]]
    ].to_h
  end

  scope :search_import, -> { includes(:content_tag_family, :book) }

  ## FriendlyId
  extend FriendlyId

  friendly_id :generate_custom_slug, use: :slugged

  def generate_custom_slug
    [%i[content_tag_family_name name]]
  end

  ## Enumerable
  # no enumerable

  ## Relations
  belongs_to :content_tag_family

  delegate :name, to: :content_tag_family, prefix: true

  has_one :book, through: :content_tag_family

  delegate :name, to: :book, prefix: true

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
  validates :name, presence: true, uniqueness: { scope: %i[content_tag_family_id], case_sensitive: false }
  validates :slug, presence: true, uniqueness: true

  ## Callbacks
  # no callback

  ## Conversion Methods
  def to_s
    name
  end
end
