# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                                                 :uuid             not null, primary key
#  alternate_name(An alias for the item)              :string
#  data(A hash to store the data of the item)         :jsonb            not null
#  description(A description of the item)             :text
#  kind(The kind or type of the item)                 :string           not null
#  metadata(A hash to store some data about the item) :jsonb            not null
#  name(The name of the item)                         :string           not null
#  position(The position of the item)                 :integer
#  settings(A hash to configure the item)             :jsonb            not null
#  slug(Human readable item identifier)               :string           not null
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#  created_by_id                                      :uuid             not null
#  updated_by_id                                      :uuid             not null
#
# Indexes
#
#  index_books_on_created_by_id  (created_by_id)
#  index_books_on_slug           (slug) UNIQUE
#  index_books_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class Book < ApplicationRecord
  # Searchkick
  searchkick highlight: %i[name alternate_name description]

  ## FriendlyId
  extend FriendlyId

  friendly_id :name, use: :slugged

  ## Enumerables

  def kind_name
    BookKind.human_attribute_name(kind)
  end

  ## Relations
  has_many :content_tag_families, -> { order(name: :asc) }, inverse_of: :book, dependent: :restrict_with_exception

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  ## Act as
  acts_as_list

  ## Validations
  validates :name, presence: true
  validates :kind, presence: true

  def to_s
    name
  end
end
