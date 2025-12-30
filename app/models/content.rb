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
#  thumbnail_id(A very small image for the item)        :uuid
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
  # Searchkick
  searchkick highlight: %i[name alternate_name description]

  def search_data
    attributes.merge(
      book_name: book.name,
      book_kind: book.kind,
    ).merge(search_data_content_tags).merge(search_data_content_attributes)
  end

  def search_data_content_tags
    ct = {}
    content_tags.each do |t|
      ct.merge!(t.content_search_data) { |key, old_value, new_value| old_value.union(new_value) }
    end
    ct
  end

  def search_data_content_attributes
    ca = {}
    content_attributes.each do |t|
      ca.merge!(t.content_search_data) { |key, old_value, new_value| old_value.union(new_value) }
    end
    ca
  end

  scope :search_import, -> { includes(:book, :thumbnail, :content_tags, :content_attributes) }

  ## FriendlyId
  extend FriendlyId

  friendly_id :name, use: :slugged

  ## Enumerables

  def kind_name
    ContentKind.human_attribute_name(kind)
  end

  ## Relations

  belongs_to :book

  belongs_to :thumbnail, class_name: 'Picture', dependent: :destroy, optional: true
  # accepts_nested_attributes_for :thumbnail, reject_if: :reject_thumbnail

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_many :content_taggings, dependent: :destroy
  has_many :content_tags, through: :content_taggings

  has_many :content_attributes, -> { order(position: :asc) }, inverse_of: :content, dependent: :restrict_with_exception

  ## Rich text

  has_rich_text :short_description
  has_rich_text :description
end
