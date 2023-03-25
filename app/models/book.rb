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
class Book < ApplicationRecord

  validates :name, presence: true

  store :display_settings, accessors: [ :color, :icon ], coder: JSON

  has_rich_text :short_description
  has_rich_text :description

  has_many :contents

  scope :sorted, -> { order(name: :asc) }

end
