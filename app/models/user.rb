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
#  role                   :integer
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
  enum role: { 'noob' => 0, 'reader' => 1, 'contributor' => 2, 'admin' => 3, 'super_admin' => 4 }
  after_initialize :set_default_role, if: :new_record?
  translate_enum :role

  default_scope { order(:email) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def noob?
    role == 'noob'
  end

  def reader?
    role == 'reader'
  end

  def contributor?
    role == 'contributor'
  end

  def admin?
    role == 'admin'
  end

  def super_admin?
    role == 'super_admin'
  end

  def set_default_role
    self.role ||= 'noob'
  end

  def to_s
    email
  end
end
