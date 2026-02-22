# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id                                                                                                         :uuid             not null, primary key
#  alternate_names(Aliases for the item)                                                                      :text
#  body_html(The json text of the item)                                                                       :text
#  body_json(The json text of the item)                                                                       :jsonb
#  data(A hash to store the data of the item)                                                                 :jsonb            not null
#  description_json(A description of the item)                                                                :jsonb
#  is_based_on_url(The URL from which the item was imported)                                                  :string
#  kind(The kind or type of the item)                                                                         :string           not null
#  metadata(A hash to store some data about the item)                                                         :jsonb            not null
#  name(The name of the item)                                                                                 :string           not null
#  settings(A hash to configure the item)                                                                     :jsonb            not null
#  short_description_json(A short description of the item)                                                    :jsonb
#  slug(Human readable item identifier)                                                                       :string           not null
#  version(The version of the item)                                                                           :string
#  created_at                                                                                                 :datetime         not null
#  updated_at                                                                                                 :datetime         not null
#  book_id(The book in which the item is located)                                                             :uuid             not null
#  created_by_id                                                                                              :uuid             not null
#  is_based_on_id(A content from which this work is derived or from which it is a modification or adaptation) :uuid
#  thumbnail_id(A very small image for the item)                                                              :uuid
#  updated_by_id                                                                                              :uuid             not null
#
# Indexes
#
#  index_contents_on_book_id         (book_id)
#  index_contents_on_created_by_id   (created_by_id)
#  index_contents_on_is_based_on_id  (is_based_on_id)
#  index_contents_on_slug            (slug) UNIQUE
#  index_contents_on_thumbnail_id    (thumbnail_id)
#  index_contents_on_updated_by_id   (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (is_based_on_id => contents.id) ON DELETE => nullify
#  fk_rails_...  (thumbnail_id => media.id) ON DELETE => cascade
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
module Bookcase
  class Content < ApplicationRecord
    self.implicit_order_column = 'created_at'

    ## Searchkick
    searchkick highlight: %i[name alternate_names short_description description body]

    def search_data
      d = attributes
      d.delete('short_description_json')
      d.delete('description_json')
      d.delete('body_json')
      d.merge(
        short_description: short_description.to_plain_text,
        description: description.to_plain_text,
        body: body.to_plain_text,
        book_id: book.id,
        book_name: book.name,
        book_kind: book.kind
      )
       .merge!(search_data_content_tags)
       .merge(search_data_content_attributes)
    end

    def search_data_content_tags
      ct = {}
      content_tags.each do |t|
        ct.merge!(t.content_search_data) { |_key, old_value, new_value| old_value.union(new_value) }
      end
      ct
    end

    def search_data_content_attributes
      ca = {}
      content_attributes.each do |t|
        ca.merge!(t.content_search_data) { |_key, old_value, new_value| old_value.union(new_value) }
      end
      ca
    end

    scope :search_import, -> { includes(:book, :thumbnail, :content_tags, :content_attributes) }

    ## FriendlyId
    extend FriendlyId

    friendly_id :name, use: :slugged

    ## Enumerable
    validates :kind, inclusion: ContentKind::KINDS

    ## Relations
    belongs_to :book

    delegate :name, to: :book, prefix: true

    belongs_to :thumbnail, class_name: 'Picture', dependent: :destroy, optional: true
    # accepts_nested_attributes_for :thumbnail, reject_if: :reject_thumbnail

    has_many :content_taggings, dependent: :destroy
    has_many :content_tags, through: :content_taggings

    has_many :content_attributes, -> {
      order(position: :asc)
    }, inverse_of: :content, dependent: :restrict_with_exception

    belongs_to :created_by, class_name: 'User'
    belongs_to :updated_by, class_name: 'User'

    ## Position
    # no position

    ## Validations
    validates :name, presence: true
    validates :kind, presence: true
    validates :slug, presence: true, uniqueness: true

    ## Callbacks
    # no callback

    ## Conversion Methods
    def to_s
      name
    end

    def short_description
      return Schemas::TipTap::Document.from_json(short_description_json) if short_description_json.present?

      Schemas::TipTap::Document.new
    end

    def description
      return Schemas::TipTap::Document.from_json(description_json) if description_json.present?

      Schemas::TipTap::Document.new
    end

    def body
      return Schemas::TipTap::Document.from_json(body_json) if body_json.present?

      Schemas::TipTap::Document.new
    end

    ## Rich text
    # serialize :short_description, coder: JSON
    # serialize :description, coder: JSON
    # serialize :body, coder: JSON
    # has_many_attached :embeds
    # before_validation do
    #   e = []
    #   e += short_description.attachables.grep(ActiveStorage::Blob) if short_description.present?
    #   e += description.attachables.grep(ActiveStorage::Blob) if description.present?
    #   e += body.attachables.grep(ActiveStorage::Blob) if body.present?
    #   self.embeds = e.uniq if e.any?
    # end

    def all_content_taggings
      @all_content_taggings ||= ContentTagging.all_content_taggings(self)
    end
  end
end
