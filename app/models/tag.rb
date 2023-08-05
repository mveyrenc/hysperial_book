# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id            :uuid             not null, primary key
#  kind          :integer          default(0)
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
#  index_tags_on_book_id        (book_id)
#  index_tags_on_created_by_id  (created_by_id)
#  index_tags_on_slug           (slug) UNIQUE
#  index_tags_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class Tag < ApplicationRecord
  belongs_to :book
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_many :relater_akin_tags,
           class_name: 'AkinTag',
           foreign_key: :relater_id,
           dependent: :restrict_with_error,
           inverse_of: :related_akin_tags
  has_many :relater_tags,
           through: :relater_akin_tags,
           source: :relater

  has_many :related_akin_tags,
           class_name: 'AkinTag',
           foreign_key: :related_id,
           dependent: :restrict_with_error,
           inverse_of: :relater_akin_tags
  has_many :related_tags,
           through: :related_akin_tags,
           source: :related

  has_many :contents, dependent: :restrict_with_error
end
