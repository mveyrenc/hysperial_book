# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :users
  # rubocop:enable Rails/HasAndBelongsToMany

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def role
    roles.any? ? roles.first.name : nil
  end

  def has_role?(role)
    case role
    when :super_admin
      self.role == role.to_s
    when :admin
      self.role == role.to_s || has_role?(:super_admin)
    when :contributor
      self.role == role.to_s || has_role?(:admin)
    when :reader
      self.role == role.to_s || has_role?(:contributor)
    else
      super
    end
  end

  def to_s
    email
  end
end
