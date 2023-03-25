class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents, id: :uuid, force: :cascade do |t|
      t.string :title
      t.string :type, null: false
      t.references :book, foreign_key: true, type: :uuid
      t.jsonb :display_settings

      t.timestamps
    end
  end
end
