# frozen_string_literal: true

# == Schema Information
#
# Table name: media
#
#  id            :uuid             not null, primary key
#  metadata      :jsonb            not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_media_on_created_by_id  (created_by_id)
#  index_media_on_type           (type)
#  index_media_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class Scan < Medium
  validates :file, presence: true

  has_one_attached :file
end
