# frozen_string_literal: true

# Add title to roles table
class AddTitleToRoles < ActiveRecord::Migration[7.0]
  def change
    change_table :roles do |t|
      t.string :title
    end
  end
end
