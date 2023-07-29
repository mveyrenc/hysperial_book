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
class Role < ApplicationRecord

  SUPER_ADMIN = Role.where(name: 'super_admin').first_or_create(title: 'Super Admin').freeze
  ADMIN = Role.where(name: 'admin').first_or_create(title: 'Admin').freeze
  CONTRIBUTOR = Role.where(name: 'contributor').first_or_create(title: 'Contributor').freeze
  READER = Role.where(name: 'reader').first_or_create(title: 'Reader').freeze

  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :users, join_table: :users_roles
  # rubocop:enable Rails/HasAndBelongsToMany

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
