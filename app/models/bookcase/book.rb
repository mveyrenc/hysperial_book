# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                                                 :uuid             not null, primary key
#  alternate_names(Aliases for the item)              :text
#  data(A hash to store the data of the item)         :jsonb            not null
#  description_json(A description of the item)        :jsonb
#  kind(The kind or type of the item)                 :string           not null
#  metadata(A hash to store some data about the item) :jsonb            not null
#  name(The name of the item)                         :string           not null
#  position(The position of the item)                 :integer          not null
#  settings(A hash to configure the item)             :jsonb            not null
#  slug(Human readable item identifier)               :string           not null
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#  created_by_id                                      :uuid             not null
#  updated_by_id                                      :uuid             not null
#
# Indexes
#
#  index_books_on_created_by_id  (created_by_id)
#  index_books_on_slug           (slug) UNIQUE
#  index_books_on_updated_by_id  (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#

require 'tip_tap'

module Bookcase
  class Book < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    searchkick highlight: %i[name alternate_names description]

    ## FriendlyId
    extend FriendlyId

    friendly_id :name, use: :slugged

    ## Enumerable
    validates :kind, inclusion: BookKind::KINDS

    ## Relations
    has_many :content_tag_families, -> { order(position: :asc) }, inverse_of: :book, dependent: :restrict_with_exception

    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'

    ## Position
    positioned

    ## Attributes cleaning
    # no attribute cleaning

    ## Validations
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :kind, presence: true
    validates :slug, presence: true, uniqueness: true

    ## Callbacks
    after_commit :reindex_books

    def reindex_books
      # Reindex all books to update position
      Book.reindex
    end

    ## Conversion Methods
    def to_s
      name
    end
  end

  ## Default values
  # no default value

  ## Rich text

  def description
    return TipTap::Document.from_json(description_json) if description_json.present?
    TipTap::Document.new
  end
end
