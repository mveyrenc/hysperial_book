class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid, force: :cascade do |t|
      t.string :name
      t.jsonb :display_settings

      t.timestamps
    end
  end
end
