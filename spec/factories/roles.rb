# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id            :uuid             not null, primary key
#  name          :string
#  resource_type :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :bigint
#
# Indexes
#
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id) UNIQUE
#  index_roles_on_resource                                (resource_type,resource_id)
#
FactoryBot.define do
  factory :role do
    name { Faker::Internet.slug }
    title { Faker::Lorem.word }
  end
end
