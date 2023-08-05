# frozen_string_literal: true

# == Schema Information
#
# Table name: media
#
#  id            :uuid             not null, primary key
#  kind          :string           not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_media_on_created_by_id  (created_by_id)
#  index_media_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class Medium < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  validates :kind, presence: true
  validates :type, presence: true
  validates :file, presence: true
  validates :created_by, presence: true
  validates :updated_by, presence: true

  # Picture media
  class Picture < Medium
    has_one_attached :file
  end

  # Scan media
  class Scan < Medium
    has_one_attached :file
  end

  # Document media
  class Document < Medium
    has_one_attached :file
  end
end
