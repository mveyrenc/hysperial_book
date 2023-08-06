# frozen_string_literal: true

# == Schema Information
#
# Table name: content_blocks
#
#  id             :uuid             not null, primary key
#  kind           :enum             not null
#  processed_data :jsonb            not null
#  raw_data       :jsonb            not null
#  settings       :jsonb            not null
#  text           :text
#  text_format    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  content_id     :uuid             not null
#  created_by_id  :uuid             not null
#  updated_by_id  :uuid             not null
#
# Indexes
#
#  index_content_blocks_on_content_id     (content_id)
#  index_content_blocks_on_created_by_id  (created_by_id)
#  index_content_blocks_on_kind           (kind)
#  index_content_blocks_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
class ContentBlock < ApplicationRecord
  belongs_to :content
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_one :content_node
  has_many :content_media

  enum kind:
       { rich_text: 'rich_text',
         yield: 'yield',
         divisions_summary: 'divisions_summary',
         division: 'division',
         equipment: 'equipment',
         ingredients_summary: 'ingredients_summary',
         ingredients: 'ingredients',
         ingredient: 'ingredient',
         supplies: 'supplies',
         tools: 'tools',
         times: 'times',
         how_to_section: 'how_to_section',
         step: 'step',
         direction: 'direction',
         nutrition: 'nutrition',
         notes: 'notes',
         comment: 'comment' }, _suffix: true

  has_rich_text :rich_text
end
