# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id            :uuid             not null, primary key
#  kind          :enum             not null
#  slug          :string           not null
#  source_url    :string
#  subtitle      :string
#  title         :string           not null
#  version       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#  created_by_id :uuid             not null
#  thumbnail_id  :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_contents_on_book_id        (book_id)
#  index_contents_on_created_by_id  (created_by_id)
#  index_contents_on_kind           (kind)
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
  friendly_id :title, use: :slugged

  belongs_to :book

  belongs_to :thumbnail, class_name: 'Picture', dependent: :destroy, optional: true
  accepts_nested_attributes_for :thumbnail, reject_if: :reject_thumbnail

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_one :content_node, dependent: :destroy

  has_many :content_taggings, dependent: :destroy
  has_many :content_tags, through: :content_taggings

  has_rich_text :short_description
  has_rich_text :description

  def thumbnail
    super || build_thumbnail
  end

  def reject_thumbnail(attributes)
    attributes['file'].nil?
  end

  ## Enumerables
  enum :kind, ContentKind.kinds, suffix: true

  def kind_name
    ContentKind.human_attribute_name(kind)
  end
end
