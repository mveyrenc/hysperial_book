# frozen_string_literal: true

# == Schema Information
#
# Table name: content_attributes
#
#  id                                                     :uuid             not null, primary key
#  alternate_names(Aliases for the item)                  :text
#  data(A hash to store the data of the item)             :jsonb            not null
#  description(A description of the item)                 :text
#  html_text(The html text of the item)                   :text
#  kind(The kind or type of the item)                     :string           not null
#  markdown_text(The markdown text of the item)           :text
#  metadata(A hash to store some data about the item)     :jsonb            not null
#  name(The name of the item)                             :string           not null
#  plain_text(The plain text of the item)                 :text
#  position(The position of the item)                     :integer          not null
#  settings(A hash to configure the item)                 :jsonb            not null
#  created_at                                             :datetime         not null
#  updated_at                                             :datetime         not null
#  content_id(The content to which the attribute belongs) :uuid             not null
#  created_by_id                                          :uuid             not null
#  updated_by_id                                          :uuid             not null
#
# Indexes
#
#  index_content_attributes_on_content_id               (content_id)
#  index_content_attributes_on_content_id_and_position  (content_id,position) UNIQUE
#  index_content_attributes_on_created_by_id            (created_by_id)
#  index_content_attributes_on_updated_by_id            (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
module Bookcase
  class ContentAttribute < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    def content_search_data
      {
        "content_attributes_k_#{kind.to_sym}": data
      }
    end

    ## Enumerable
    validates :kind, inclusion: ContentAttributeKind::AVAILABLE_KINDS.keys.map(&:to_s)

    def data_type
      ContentAttributeKind.data_type(kind)
    end

    ## Relations
    belongs_to :content

    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'

    ## Validations
    validates :name, presence: true
    validates :kind, presence: true

    ## Position
    positioned on: :content

    ## Callbacks
    # no callback

    ## Conversion Methods
    # no conversion method
  end
end
