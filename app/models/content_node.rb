# frozen_string_literal: true

# == Schema Information
#
# Table name: content_nodes
#
#  id               :uuid             not null, primary key
#  ancestry         :string           not null
#  position         :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  content_block_id :uuid
#  content_id       :uuid
#  created_by_id    :uuid             not null
#  updated_by_id    :uuid             not null
#
# Indexes
#
#  index_content_nodes_on_ancestry          (ancestry)
#  index_content_nodes_on_content_block_id  (content_block_id)
#  index_content_nodes_on_content_id        (content_id)
#  index_content_nodes_on_created_by_id     (created_by_id)
#  index_content_nodes_on_updated_by_id     (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_block_id => content_blocks.id)
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentNode < ApplicationRecord
  belongs_to :content
  belongs_to :content_block
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_ancestry orphan_strategy: :destroy, cache_depth: true, counter_cache: true,
               primary_key_format: '[-A-Fa-f0-9]{36}', update_strategy: :sql
  acts_as_list scope: [:ancestry]
end
