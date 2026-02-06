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
module Bookcase
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
    validates :related, uniqueness: { scope: :relater }, comparison: { other_than: :relater }
    validates :kind, presence: true

    ## Callbacks
    # no callback

    ## Conversion Methods
    # no conversion method

    ## Default values
    def set_defaults
      self.kind ||= :limited_relation
    end

    def self.all_related_tags(relater)
      self.all_akin_tags(relater, :relater, :related)
    end

    def self.all_relater_tags(related)
      self.all_akin_tags(related, :related, :relater)
    end

    def self.all_akin_tags(content_tag, from, to)
      excludes = AkinContentTag.includes([to]).where("#{from}": content_tag, kind: :excludes).to_a
      all_relations = excludes
      tags_to_parse = [content_tag]
      loop do
        tag = tags_to_parse.shift
        break if tag.nil?
        relations = AkinContentTag.includes([to]).where("#{from}": tag)
        relations.each do |relation|
          next unless all_relations.index { |e| e.send(to) == relation.send(to) }.nil?
          if relation.kind == "followable_relation"
            tags_to_parse << relation.send(to)
          end
          k = "computed"
          if tag != content_tag
            if relation.kind == "suggests"
              k = "computed_suggestion"
            elsif relation.kind == "excludes"
              k = "computed_exclusion"
            end
          end
          all_relations << AkinContentTag.new("#{from}": content_tag, "#{to}": relation.send(to), kind: k)
        end
      end
      all_relations
    end
  end
end
