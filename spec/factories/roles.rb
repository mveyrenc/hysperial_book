# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Internet.slug }
    title { Faker::Lorem.word }
  end
end
