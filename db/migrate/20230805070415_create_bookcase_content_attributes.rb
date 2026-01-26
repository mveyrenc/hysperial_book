# frozen_string_literal: true

# == Schema Information
#
# Table name: content_attributes
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
#  index_content_attributes_on_content_block_id  (content_block_id)
#  index_content_attributes_on_created_by_id     (created_by_id)
#  index_content_attributes_on_kind              (kind)
#  index_content_attributes_on_medium_id         (medium_id)
#  index_content_attributes_on_updated_by_id     (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_block_id => content_blocks.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (medium_id => media.id)
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class CreateBookcaseContentAttributes < ActiveRecord::Migration[8.0]
  def change
    create_table :content_attributes, id: :uuid do |t|
      t.string :name, null: false, comment: 'The name of the item'
      t.text :alternate_names, null: true, comment: 'Aliases for the item'
      t.text :description, null: true, comment: 'A description of the item'

      t.string :kind, null: false, comment: 'The kind or type of the item'

      t.references :content, null: false, foreign_key: true, type: :uuid,
                             comment: 'The content to which the attribute belongs'

      t.integer :position, null: false,comment: 'The position of the item'

      t.text :plain_text, null: true, comment: 'The plain text of the item'
      t.text :markdown_text, null: true, comment: 'The markdown text of the item'
      t.text :html_text, null: true, comment: 'The html text of the item'
      t.jsonb :data, null: false, default: {}, comment: 'A hash to store the data of the item'
      t.jsonb :metadata, null: false, default: {}, comment: 'A hash to store some data about the item'
      t.jsonb :settings, null: false, default: {}, comment: 'A hash to configure the item'

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps

      t.index [:content_id, :position], unique: true
    end
  end
end
