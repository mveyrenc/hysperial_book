# frozen_string_literal: true

# == Schema Information
#
# Table name: content_blocks
#
#  id             :uuid             not null, primary key
#  kind           :enum             not null
#  processed_data :jsonb            not null
#  raw_data       :jsonb            not null
#  settings       :jsonb            not null
#  text           :text
#  text_format    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  content_id     :uuid             not null
#  created_by_id  :uuid             not null
#  updated_by_id  :uuid             not null
#
# Indexes
#
#  index_content_blocks_on_content_id     (content_id)
#  index_content_blocks_on_created_by_id  (created_by_id)
#  index_content_blocks_on_kind           (kind)
#  index_content_blocks_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class CreateContentBlocks < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :content_blocks, id: :uuid do |t|
      t.column :kind, :content_block_kind, null: false, index: true

      t.references :content, null: false, foreign_key: true, type: :uuid

      t.jsonb :raw_data, null: false, default: {}
      t.jsonb :settings, null: false, default: {}
      t.jsonb :processed_data, null: false, default: {}
      t.text :text
      t.string :text_format

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
