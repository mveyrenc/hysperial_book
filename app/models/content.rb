# == Schema Information
#
# Table name: contents
#
#  id               :uuid             not null, primary key
#  display_settings :jsonb
#  title            :string
#  type             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  book_id          :uuid
#
# Indexes
#
#  index_contents_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class Content < ApplicationRecord
  self.inheritance_column = 'type'

  has_rich_text :short_description
  has_rich_text :body

  has_one_attached :thumbnail

  belongs_to :book
end
