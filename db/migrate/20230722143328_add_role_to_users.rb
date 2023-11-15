# frozen_string_literal: true

#
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
#  role                   :enum
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
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM (
          'super_admin',
          'admin',
          'contributor',
          'reader',
          'noob'
          )
    SQL

    add_column :users, :role, :user_role
    add_index :users, :role
  end
  # rubocop:enable Metrics/MethodLength

  def down
    remove_column :users, :role
    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
