# frozen_string_literal: true

# == Schema Information
#
# Table name: media
#
#  id            :uuid             not null, primary key
#  metadata      :jsonb            not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_media_on_created_by_id  (created_by_id)
#  index_media_on_id_and_type    (id,type)
#  index_media_on_type           (type)
#  index_media_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
module Bookcase
  class Medium < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    searchkick

    ## FriendlyId
    # no friendly id

    ## Enumerable
    # no enumerable

    ## Relations
    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'

    ## Position
    # no position

    ## Validations
    validates :type, presence: true

    ## Callbacks
    # no callback

    ## Conversion Methods
    # no conversion method
  end
end
