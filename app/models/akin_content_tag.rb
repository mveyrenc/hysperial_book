# frozen_string_literal: true

# == Schema Information
#
# Table name: akin_content_tags
#
#  id         :uuid             not null, primary key
#  kind       :string           not null
#  metadata   :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  related_id :uuid             not null
#  relater_id :uuid             not null
#
# Indexes
#
#  index_akin_content_tags_on_kind                       (kind)
#  index_akin_content_tags_on_related_id                 (related_id)
#  index_akin_content_tags_on_relater_id                 (relater_id)
#  index_akin_content_tags_on_relater_id_and_related_id  (relater_id,related_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (related_id => content_tags.id) ON DELETE => cascade
#  fk_rails_...  (relater_id => content_tags.id) ON DELETE => cascade
#
class AkinContentTag < ApplicationRecord
  self.implicit_order_column = 'created_at'

  ## Searchkick
  # no search

  ## FriendlyId
  # no friendly id

  ## Enumerable
  validates :kind, inclusion: AkinContentTagKind::KINDS

  ## Relations
  belongs_to :relater, class_name: 'ContentTag'
  belongs_to :related, class_name: 'ContentTag'

  ## Position
  # no position

  ## Validations
  validates :relater, presence: true
  validates :related, presence: true, uniqueness: { scope: :relater }, comparison: { other_than: :relater }
  validates :kind, presence: true

  ## Callbacks
  # no callback

  ## Conversion Methods
  # no conversion method

  ## Default values
  def set_defaults
    self.kind ||= :limited_relation
  end
end
