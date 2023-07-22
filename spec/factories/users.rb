# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :user_with_role do
      transient do
        role { FactoryBot.create(:role) }
      end

      after(:create) do |user, evaluator|
        user.add_role evaluator.role.name
      end
    end
  end
end
