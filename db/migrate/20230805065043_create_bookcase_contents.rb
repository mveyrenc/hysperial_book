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
class CreateBookcaseContents < ActiveRecord::Migration[8.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :contents, id: :uuid do |t|
      t.string :name, null: false, comment: 'The name of the item'
      t.text :alternate_names, null: true, comment: 'Aliases for the item'
      t.text :short_description, null: true, comment: 'A short description of the item'
      t.text :description, null: true, comment: 'A description of the item'

      t.string :slug, null: false, index: { unique: true }, comment: 'Human readable item identifier'
      t.string :kind, null: false, comment: 'The kind or type of the item'

      t.references :book, null: false, foreign_key: true, type: :uuid, comment: 'The book in which the item is located'

      t.references :is_based_on, null: true, foreign_key: { to_table: :contents, on_delete: :nullify }, type: :uuid,
                                 comment: 'A content from which this work is derived or from which it is a modification or adaptation'
      t.string :version, null: true, comment: 'The version of the item'
      t.string :is_based_on_url, null: true, comment: 'The URL from which the item was imported'

      t.references :thumbnail, null: true, foreign_key: { to_table: :media, on_delete: :cascade }, type: :uuid,
                               comment: 'A very small image for the item'

      t.jsonb :data, null: false, default: {}, comment: 'A hash to store the data of the item'
      t.jsonb :metadata, null: false, default: {}, comment: 'A hash to store some data about the item'
      t.jsonb :settings, null: false, default: {}, comment: 'A hash to configure the item'

      t.references :created_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid
      t.references :updated_by, null: false, foreign_key: { to_table: :users, on_delete: :restrict }, type: :uuid

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
