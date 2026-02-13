# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tag_families
#
#  id                                                 :uuid             not null, primary key
#  alternate_names(Aliases for the item)              :text
#  data(A hash to store the data of the item)         :jsonb            not null
#  description_json(A description of the item)        :jsonb
#  kind                                               :string           not null
#  metadata(A hash to store some data about the item) :jsonb            not null
#  name(The name of the item)                         :string           not null
#  position(The position of the item)                 :integer          not null
#  settings(A hash to configure the item)             :jsonb            not null
#  slug                                               :string           not null
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#  book_id                                            :uuid             not null
#  created_by_id                                      :uuid             not null
#  updated_by_id                                      :uuid             not null
#
# Indexes
#
#  index_content_tag_families_on_book_id                    (book_id)
#  index_content_tag_families_on_book_id_and_position       (book_id,position) UNIQUE
#  index_content_tag_families_on_created_by_id              (created_by_id)
#  index_content_tag_families_on_name_and_book_id_and_kind  (name,book_id,kind) UNIQUE
#  index_content_tag_families_on_slug                       (slug) UNIQUE
#  index_content_tag_families_on_updated_by_id              (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
module Bookcase
  class ContentTagFamily < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    searchkick highlight: %i[name book_name]

    def search_data
      attributes.merge(
        book_name: book.name,
        book_kind: book.kind,
        book_position: book.position
      )
    end

    scope :search_import, -> { includes(:book) }

    def self.content_tags_index_id(family)
      :"content_tags_id_#{family.id}"
    end

    def self.content_tags_index_name(family)
      :"content_tags_n_#{family.id}"
    end

    def self.content_tags_index_kind(family)
      :"content_tags_k_#{family.kind}"
    end

    ## FriendlyId
    extend FriendlyId

    friendly_id :generate_custom_slug, use: :slugged

    def generate_custom_slug
      [%i[kind name]]
    end

    ## Enumerable
    validates :kind, inclusion: ContentTagFamilyKind::KINDS

    ## Relations
    belongs_to :book

    has_many :content_tags, -> { order(name: :asc) }, dependent: :destroy, inverse_of: :content_tag_family

    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'

    ## Position
    positioned on: :book

    ## Validations
    validates :name, presence: true, uniqueness: { scope: %i[kind book_id], case_sensitive: false }
    validates :kind, presence: true
    validates :slug, presence: true, uniqueness: true

    ## Callbacks
    after_commit :reindex_content_tag_families

    def reindex_content_tag_families
      # Reindex tag families related to the same book to update position
      ContentTagFamily.where(book: book).reindex
    end

    ## Conversion Methods
    def to_s
      name
    end



    ## Rich text

    def description
      return TipTap::Document.from_json(body_json) if body_json.present?
      TipTap::Document.new
    end
  end
end
