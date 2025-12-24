# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tags
#
#  id                                                         :uuid             not null, primary key
#  metadata(A hash to store some data about the item)         :jsonb            not null
#  name(The name of the item)                                 :string           not null
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
  ## delegate
  delegate :name, to: :content_tag_family, prefix: true

  ## FriendlyId
  extend FriendlyId

  friendly_id :generate_custom_slug, use: :slugged

  def generate_custom_slug
    [%i[content_tag_family_name name]]
  end

  def kind_name
    ContentTagFamily.human_attribute_name(kind)
  end

  ## Relations
  belongs_to :content_tag_family
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
  validates :name, presence: true, uniqueness: { scope: %i[content_tag_family] }
end
