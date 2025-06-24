# frozen_string_literal: true

# Add name in users table
class AddNameToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      t.string :name
    end
  end
end
