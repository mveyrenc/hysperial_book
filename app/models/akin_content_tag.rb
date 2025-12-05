# frozen_string_literal: true

# == Schema Information
#
# Table name: akin_content_tags
#
#  kind       :enum             default("direct"), not null
#  metadata   :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
#  fk_rails_...  (related_id => content_tags.id) ON DELETE => cascade
#  fk_rails_...  (relater_id => content_tags.id) ON DELETE => cascade
#
class AkinContentTag < ApplicationRecord
  belongs_to :relater, class_name: 'ContentTag'
  belongs_to :related, class_name: 'ContentTag'

  enum :kind,
       { direct: 'direct',
         followable: 'followable',
         computed: 'computed' }, suffix: true
end
