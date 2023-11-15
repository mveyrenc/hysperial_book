# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tags
#
#  id            :uuid             not null, primary key
#  kind          :enum             not null
#  slug          :string
#  value         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_tags_on_book_id        (book_id)
#  index_tags_on_created_by_id  (created_by_id)
#  index_tags_on_kind           (kind)
#  index_tags_on_slug           (slug) UNIQUE
#  index_tags_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
# == Schema Information
#
# Table name: akin_content_tags
#
#  kind       :enum             not null
#  related_id :uuid             not null
#  relater_id :uuid             not null
#
# Indexes
#
#  index_akin_content_tags_on_kind        (kind)
#  index_akin_content_tags_on_related_id  (related_id)
#  index_akin_content_tags_on_relater_id  (relater_id)
#
# Foreign Keys
#
#  fk_rails_...  (related_id => tags.id) ON DELETE => cascade
#  fk_rails_...  (relater_id => tags.id) ON DELETE => cascade
#
class CreateContentTags < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :content_tags, id: :uuid do |t|
      t.column :kind, :content_tag_kind, null: false, index: true
      t.references :book, null: false, foreign_key: true, type: :uuid
      t.string :slug, null: false, index: { unique: true }
      t.string :value

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
    # rubocop:enable Metrics/MethodLength
    create_table :akin_content_tags, id: false do |t|
      t.references :relater, null: false, foreign_key: { to_table: :content_tags, on_delete: :cascade }, type: :uuid
      t.references :related, null: false, foreign_key: { to_table: :content_tags, on_delete: :cascade }, type: :uuid

      t.column :kind, :akin_content_tag_kind, null: false, index: true
    end

    create_table :content_tags_contents, id: false do |t|
      t.references :content, null: false, foreign_key: { to_table: :contents, on_delete: :cascade }, type: :uuid
      t.references :content_tag, null: false, foreign_key: { to_table: :content_tags, on_delete: :cascade }, type: :uuid
    end
  end
end
