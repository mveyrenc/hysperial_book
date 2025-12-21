# frozen_string_literal: true
# == Schema Information
#
# Table name: content_attributes
#
#  id            :uuid             not null, primary key
#  kind          :enum             default("document"), not null
#  metadata      :jsonb            not null
#  position      :integer
#  settings      :jsonb            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  content_id    :uuid             not null
#  created_by_id :uuid             not null
#  updated_by_id :uuid             not null
#
# Indexes
#
#  index_content_attributes_on_content_id     (content_id)
#  index_content_attributes_on_created_by_id  (created_by_id)
#  index_content_attributes_on_kind           (kind)
#  index_content_attributes_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentAttribute < ApplicationRecord

  ## Enumerables
  enum :kind, ContentAttributeKind.kinds, suffix: true

  def kind_name
    ContentAttributeKind.human_attribute_name(kind)
  end

  ## Relations
  belongs_to :content

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  ## Act as
  acts_as_list

  ## Validations

end
