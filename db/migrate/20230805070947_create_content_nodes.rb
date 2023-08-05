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
class CreateContentNodes < ActiveRecord::Migration[7.0]
  def change
    create_table :content_nodes, id: :uuid do |t|
      t.string :ancestry, collation: 'C', null: false
      t.index 'ancestry'

      t.integer :position, null: false, default: 0

      t.references :content, null: true, foreign_key: true, type: :uuid
      t.references :content_block, null: true, foreign_key: true, type: :uuid
      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
