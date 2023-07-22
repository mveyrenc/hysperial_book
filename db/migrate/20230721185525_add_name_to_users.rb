# frozen_string_literal: true

# Add name in users table
class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
