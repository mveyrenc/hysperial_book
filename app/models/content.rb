# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id                                                   :uuid             not null, primary key
#  alternate_name(An alias for the item)                :string
#  kind(The kind or type of the item)                   :string           not null
#  metadata(A hash to store some data about the item)   :jsonb            not null
#  name(The name of the item)                           :string           not null
#  slug(Human readable item identifier)                 :string           not null
#  source_url(The URL from which the item was imported) :string
#  version(The version of the item)                     :string
#  created_at                                           :datetime         not null
#  updated_at                                           :datetime         not null
#  book_id(The book in which the item is located)       :uuid             not null
#  created_by_id                                        :uuid             not null
#  thumbnail_id(A very small image for the item)        :uuid             not null
#  updated_by_id                                        :uuid             not null
#
# Indexes
#
#  index_contents_on_book_id        (book_id)
#  index_contents_on_created_by_id  (created_by_id)
#  index_contents_on_slug           (slug) UNIQUE
#  index_contents_on_thumbnail_id   (thumbnail_id)
#  index_contents_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (thumbnail_id => media.id) ON DELETE => cascade
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class Content < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  belongs_to :book

  belongs_to :thumbnail, class_name: 'Picture', dependent: :destroy, optional: true
  accepts_nested_attributes_for :thumbnail, reject_if: :reject_thumbnail

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_many :content_taggings, dependent: :destroy
  has_many :content_tags, through: :content_taggings

  has_many :content_attributes, -> { order(position: :asc) }

  has_rich_text :short_description
  has_rich_text :description

  def thumbnail
    super || build_thumbnail
  end

  def reject_thumbnail(attributes)
    attributes['file'].nil?
  end

  ## Enumerables
  # enum :kind, ContentKind.kinds, suffix: true

  def kind_name
    ContentKind.human_attribute_name(kind)
  end
end
