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
require "test_helper"

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
