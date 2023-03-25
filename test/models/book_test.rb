# == Schema Information
#
# Table name: books
#
#  id               :uuid             not null, primary key
#  display_settings :jsonb
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
