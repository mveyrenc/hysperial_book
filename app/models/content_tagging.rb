# frozen_string_literal: true

# == Schema Information
#
# Table name: content_taggings
#
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
