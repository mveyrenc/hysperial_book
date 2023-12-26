# frozen_string_literal: true

# == Schema Information
#
# Table name: content_nodes
#
#  id               :uuid             not null, primary key
#  ancestry         :string           not null
#  ancestry_depth   :integer          default(0)
#  children_count   :integer          default(0), not null
#  depth            :integer
#  lft              :uuid
#  position         :integer          default(0), not null
#  rgt              :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  content_block_id :uuid
#  content_id       :uuid
#  created_by_id    :uuid             not null
#  parent_id        :uuid
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
  belongs_to :content, validate: { presence: true, if: -> { is_root? } }
  belongs_to :content_block, validate: { presence: true, if: -> { has_parent? } }
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  acts_as_nested_set scope: [:content_id],
                     dependent: :destroy,
                     counter_cache: :children_count,
                     order_column: :position
end
