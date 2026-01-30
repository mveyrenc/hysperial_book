# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                                                 :uuid             not null, primary key
#  alternate_names(Aliases for the item)              :text
#  data(A hash to store the data of the item)         :jsonb            not null
#  description(A description of the item)             :text
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
FactoryBot.define do
  factory :book, class: 'Bookcase::Book' do
    sequence(:name) { |n| "#{Faker::Name.title} #{n}" }
    kind { Bookcase::BookKind::KINDS.sample }
    created_by factory: :user
    updated_by factory: :user

    trait :reindex do
      after(:create) do |elem, _evaluator|
        elem.reindex(refresh: true)
      end
    end
  end
end
