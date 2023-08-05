# frozen_string_literal: true

# == Schema Information
#
# Table name: akin_tags
#
#  kind       :string           not null
#  related_id :uuid             not null
#  relater_id :uuid             not null
#
# Indexes
#
#  index_akin_tags_on_related_id  (related_id)
#  index_akin_tags_on_relater_id  (relater_id)
#
# Foreign Keys
#
#  fk_rails_...  (related_id => tags.id) ON DELETE => cascade
#  fk_rails_...  (relater_id => tags.id) ON DELETE => cascade
#
class AkinTag < ApplicationRecord
  belongs_to :relater, class_name: 'Tag'
  belongs_to :related, class_name: 'Tag'
end
