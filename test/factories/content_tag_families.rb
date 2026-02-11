# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tag_families
#
#  id                                                 :uuid             not null, primary key
#  alternate_names(Aliases for the item)              :text
#  data(A hash to store the data of the item)         :jsonb            not null
#  description(A description of the item)             :json
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
FactoryBot.define do
  factory :content_tag_family, class: 'Bookcase::ContentTagFamily' do
    sequence(:name) { |n| "#{Faker::Name.title} #{n}" }
    kind { Bookcase::ContentTagFamilyKind::KINDS.sample }
    book factory: :book
    created_by factory: :user
    updated_by factory: :user

    trait :reindex do
      after(:create) do |elem, _evaluator|
        elem.reindex(refresh: true)
      end
    end
  end
end
