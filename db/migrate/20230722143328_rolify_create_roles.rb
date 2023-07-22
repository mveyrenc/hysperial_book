# frozen_string_literal: true

# Create roles table
class RolifyCreateRoles < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps

      t.index %i[name resource_type resource_id], unique: true
    end

    create_table(:users_roles, id: false) do |t|
      t.references :user, null: false, index: false, type: :uuid
      t.references :role, null: false, index: false, type: :uuid

      t.foreign_key :users, on_delete: :cascade
      t.foreign_key :roles, on_delete: :cascade
    end
  end
  # rubocop:enable Metrics/MethodLength
end
