# frozen_string_literal: true

# == Schema Information
#
# Table name: content_media
#
#  id               :uuid             not null, primary key
#  kind             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  content_block_id :uuid             not null
#  created_by_id    :uuid             not null
#  medium_id        :uuid             not null
#  updated_by_id    :uuid             not null
#
# Indexes
#
#  index_content_media_on_content_block_id  (content_block_id)
#  index_content_media_on_created_by_id     (created_by_id)
#  index_content_media_on_medium_id         (medium_id)
#  index_content_media_on_updated_by_id     (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_block_id => content_blocks.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (medium_id => media.id)
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class CreateContentMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :content_media, id: :uuid do |t|
      t.string :kind
      t.references :content_block, null: false, foreign_key: true, type: :uuid
      t.references :medium, null: false, foreign_key: true, type: :uuid
      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
