# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           not null
#  encrypted_password     :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  metadata               :jsonb            not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("noob"), not null
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role                  (role)
#
class User < ApplicationRecord
  ## Callbacks
  after_initialize :set_defaults

  ## Enumerables
  def role_name
    UserRole.human_attribute_name(role)
  end

  def noob_role?
    role == 'noob'
  end

  def reader_role?
    role == 'reader'
  end

  def contributor_role?
    role == 'contributor'
  end

  def admin_role?
    role == 'admin'
  end

  def super_admin_role?
    role == 'super_admin'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end

  protected

  def set_defaults
    self.role ||= :noob
  end
end
