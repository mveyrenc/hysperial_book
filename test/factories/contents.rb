# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id                                                                                                         :uuid             not null, primary key
#  alternate_names(Aliases for the item)                                                                      :text
#  data(A hash to store the data of the item)                                                                 :jsonb            not null
#  description(A description of the item)                                                                     :text
#  is_based_on_url(The URL from which the item was imported)                                                  :string
#  kind(The kind or type of the item)                                                                         :string           not null
#  metadata(A hash to store some data about the item)                                                         :jsonb            not null
#  name(The name of the item)                                                                                 :string           not null
#  settings(A hash to configure the item)                                                                     :jsonb            not null
#  short_description(A short description of the item)                                                         :text
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
FactoryBot.define do
  factory :content, class: 'Bookcase::Content' do
    sequence(:name) { |n| "#{Faker::Name.title} #{n}" }
    book factory: :book
    kind { Bookcase::ContentKind::KINDS.sample }
    created_by factory: :user
    updated_by factory: :user

    trait :reindex do
      after(:create) do |elem, _evaluator|
        elem.reindex(refresh: true)
      end
    end
  end
end
