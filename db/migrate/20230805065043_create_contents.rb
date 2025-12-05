# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id            :uuid             not null, primary key
#  kind          :enum             not null
#  slug          :string           not null
#  source_url    :string
#  subtitle      :string
#  title         :string           not null
#  version       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#  created_by_id :uuid             not null
#  thumbnail_id  :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_contents_on_book_id        (book_id)
#  index_contents_on_created_by_id  (created_by_id)
#  index_contents_on_kind           (kind)
#  index_contents_on_slug           (slug) UNIQUE
#  index_contents_on_thumbnail_id   (thumbnail_id)
#  index_contents_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (thumbnail_id => media.id) ON DELETE => cascade
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class CreateContents < ActiveRecord::Migration[8.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_enum :content_kind, %w[article tutorial ingredient recipe menu pattern]
    create_table :contents, id: :uuid do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :slug, null: false, index: { unique: true }

      t.enum :kind, enum_type: :content_kind, default: :article, null: false, index: true
      t.references :book, null: false, foreign_key: true, type: :uuid

      t.string :version
      t.string :source_url

      t.references :thumbnail, null: false, foreign_key: { to_table: :media, on_delete: :cascade }, type: :uuid

      t.jsonb :metadata, null: false, default: {}

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
