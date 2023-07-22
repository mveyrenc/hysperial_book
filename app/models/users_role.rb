# frozen_string_literal: true

# == Schema Information
#
# Table name: users_roles
#
#  role_id :uuid             not null
#  user_id :uuid             not null
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
