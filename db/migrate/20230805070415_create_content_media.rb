# frozen_string_literal: true

# == Schema Information
#
# Table name: content_media
#
#  id               :uuid             not null, primary key
#  kind             :enum             not null
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
#  index_content_media_on_kind              (kind)
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
class CreateContentMedia < ActiveRecord::Migration[8.0]
  def change
    create_enum :content_medium_kind, %w[document scanned_document before_picture during_picture after_picture]
    create_table :content_media, id: :uuid do |t|
      t.enum :kind, enum_type: :content_medium_kind, default: :document, null: false, index: true

      t.references :content, null: false, foreign_key: true, type: :uuid
      t.references :medium, null: false, foreign_key: true, type: :uuid

      t.jsonb :metadata, null: false, default: {}

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
end
