# frozen_string_literal: true

# == Schema Information
#
# Table name: content_tags
#
#  id                                                         :uuid             not null, primary key
#  alternate_names(Aliases for the item)                      :text
#  data(A hash to store the data of the item)                 :jsonb            not null
#  description_json(A description of the item)                :jsonb
#  metadata(A hash to store some data about the item)         :jsonb            not null
#  name(The name of the item)                                 :string           not null
#  settings(A hash to configure the item)                     :jsonb            not null
#  slug(Human readable item identifier)                       :string           not null
#  created_at                                                 :datetime         not null
#  updated_at                                                 :datetime         not null
#  content_tag_family_id(The family to which the tag belongs) :uuid             not null
#  created_by_id                                              :uuid             not null
#  updated_by_id                                              :uuid             not null
#
# Indexes
#
#  index_content_tags_on_content_tag_family_id           (content_tag_family_id)
#  index_content_tags_on_created_by_id                   (created_by_id)
#  index_content_tags_on_name_and_content_tag_family_id  (name,content_tag_family_id) UNIQUE
#  index_content_tags_on_slug                            (slug) UNIQUE
#  index_content_tags_on_updated_by_id                   (updated_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_tag_family_id => content_tag_families.id)
#  fk_rails_...  (created_by_id => users.id) ON DELETE => restrict
#  fk_rails_...  (updated_by_id => users.id) ON DELETE => restrict
#
FactoryBot.define do
  factory :content_tag, class: 'Bookcase::ContentTag' do
    sequence(:name) { |n| "#{Faker::Name.title} #{n}" }
    content_tag_family  factory: :content_tag_family
    created_by factory: :user
    updated_by factory: :user

    trait :reindex do
      after(:create) do |elem, _evaluator|
        elem.reindex(refresh: true)
      end
    end
  end
end
