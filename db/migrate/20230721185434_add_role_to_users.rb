# frozen_string_literal: true

# Add role in users table
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
  end
end
