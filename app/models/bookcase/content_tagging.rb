# frozen_string_literal: true

# Relation between contents and tags.
# Used to tag contents.

# == Schema Information
#
# Table name: content_taggings
#
#  id             :uuid             not null, primary key
#  metadata       :jsonb            not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  content_id     :uuid             not null
#  content_tag_id :uuid             not null
#
# Indexes
#
#  index_content_taggings_on_content_id                     (content_id)
#  index_content_taggings_on_content_id_and_content_tag_id  (content_id,content_tag_id) UNIQUE
#  index_content_taggings_on_content_tag_id                 (content_tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id) ON DELETE => cascade
#  fk_rails_...  (content_tag_id => content_tags.id) ON DELETE => cascade
#
module Bookcase
  class ContentTagging < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    # no search

    ## FriendlyId
    # no friendly id

    ## Enumerable
    # no enumerable

    ## Relations
    belongs_to :content
    belongs_to :content_tag

    ## Position
    # no position

    ## Validations
    validates :content_tag, uniqueness: { scope: :content }

    ## Callbacks
    # no callback

    ## Conversion Methods
    # no conversion method

    ## Default values
    # no default value

    # rubocop:disable Metrics/CyclomaticComplexity
    def self.all_content_taggings(content)
      all_content_taggings = content.content_taggings.to_a
      excludes = []
      tags_to_parse = content.content_tags.to_a
      loop do
        tag = tags_to_parse.shift
        break if tag.nil?

        relations = AkinContentTag.includes([:related]).includes(related: [:content_tag_family]).where(relater: tag).to_a
        excludes += relations.select { |e| e.kind == 'excludes' }
        relations.reject { |e| e.kind == 'excludes' }.each do |relation|
          next unless all_content_taggings.index { |e| e.content_tag == relation.related }.nil? &&
                      excludes.index { |e| e.content_tag == relation.related }.nil?

          tags_to_parse << relation.related if relation.kind == 'followable_relation'
          all_content_taggings << ContentTagging.new(content: content, content_tag: relation.related)
        end
      end
      all_content_taggings
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end
end
