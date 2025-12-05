# frozen_string_literal: true

# Relation between contents and tags.
# Used to tag contents.

# == Schema Information
#
# Table name: content_taggings
#
#  metadata       :jsonb            not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  content_id     :uuid             not null
#  content_tag_id :uuid             not null
#
# Indexes
#
#  index_content_taggings_on_content_id      (content_id)
#  index_content_taggings_on_content_tag_id  (content_tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id) ON DELETE => cascade
#  fk_rails_...  (content_tag_id => content_tags.id) ON DELETE => cascade
#
class ContentTagging < ApplicationRecord
  belongs_to :content
  belongs_to :content_tag
end
