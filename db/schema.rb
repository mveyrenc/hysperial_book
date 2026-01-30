# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_22_101009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.uuid "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_id", "record_type"], name: "index_active_storage_attachments_on_record_id_and_record_type"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "idx_on_record_type_record_id_name_blob_id_0be5805727", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "idx_on_blob_id_variation_digest_f36bede0d9", unique: true
  end

  create_table "akin_content_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind", null: false
    t.jsonb "metadata", default: {}, null: false
    t.uuid "related_id", null: false
    t.uuid "relater_id", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_akin_content_tags_on_kind"
    t.index ["related_id"], name: "index_akin_content_tags_on_related_id"
    t.index ["relater_id", "related_id"], name: "index_akin_content_tags_on_relater_id_and_related_id", unique: true
    t.index ["relater_id"], name: "index_akin_content_tags_on_relater_id"
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternate_names", comment: "Aliases for the item"
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "data", default: {}, null: false, comment: "A hash to store the data of the item"
    t.text "description", comment: "A description of the item"
    t.string "kind", null: false, comment: "The kind or type of the item"
    t.jsonb "metadata", default: {}, null: false, comment: "A hash to store some data about the item"
    t.string "name", null: false, comment: "The name of the item"
    t.integer "position", null: false, comment: "The position of the item"
    t.jsonb "settings", default: {}, null: false, comment: "A hash to configure the item"
    t.string "slug", null: false, comment: "Human readable item identifier"
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_books_on_created_by_id"
    t.index ["slug"], name: "index_books_on_slug", unique: true
    t.index ["updated_by_id"], name: "index_books_on_updated_by_id"
  end

  create_table "content_attributes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternate_names", comment: "Aliases for the item"
    t.uuid "content_id", null: false, comment: "The content to which the attribute belongs"
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "data", default: {}, null: false, comment: "A hash to store the data of the item"
    t.text "description", comment: "A description of the item"
    t.text "html_text", comment: "The html text of the item"
    t.string "kind", null: false, comment: "The kind or type of the item"
    t.text "markdown_text", comment: "The markdown text of the item"
    t.jsonb "metadata", default: {}, null: false, comment: "A hash to store some data about the item"
    t.string "name", null: false, comment: "The name of the item"
    t.text "plain_text", comment: "The plain text of the item"
    t.integer "position", null: false, comment: "The position of the item"
    t.jsonb "settings", default: {}, null: false, comment: "A hash to configure the item"
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.index ["content_id", "position"], name: "index_content_attributes_on_content_id_and_position", unique: true
    t.index ["content_id"], name: "index_content_attributes_on_content_id"
    t.index ["created_by_id"], name: "index_content_attributes_on_created_by_id"
    t.index ["updated_by_id"], name: "index_content_attributes_on_updated_by_id"
  end

  create_table "content_tag_families", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternate_names", comment: "Aliases for the item"
    t.uuid "book_id", null: false
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "data", default: {}, null: false, comment: "A hash to store the data of the item"
    t.text "description", comment: "A description of the item"
    t.string "kind", null: false
    t.jsonb "metadata", default: {}, null: false, comment: "A hash to store some data about the item"
    t.string "name", null: false, comment: "The name of the item"
    t.integer "position", null: false, comment: "The position of the item"
    t.jsonb "settings", default: {}, null: false, comment: "A hash to configure the item"
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.index ["book_id", "position"], name: "index_content_tag_families_on_book_id_and_position", unique: true
    t.index ["book_id"], name: "index_content_tag_families_on_book_id"
    t.index ["created_by_id"], name: "index_content_tag_families_on_created_by_id"
    t.index ["name", "book_id", "kind"], name: "index_content_tag_families_on_name_and_book_id_and_kind", unique: true
    t.index ["slug"], name: "index_content_tag_families_on_slug", unique: true
    t.index ["updated_by_id"], name: "index_content_tag_families_on_updated_by_id"
  end

  create_table "content_taggings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "content_id", null: false
    t.uuid "content_tag_id", null: false
    t.datetime "created_at", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "updated_at", null: false
    t.index ["content_id", "content_tag_id"], name: "index_content_taggings_on_content_id_and_content_tag_id", unique: true
    t.index ["content_id"], name: "index_content_taggings_on_content_id"
    t.index ["content_tag_id"], name: "index_content_taggings_on_content_tag_id"
  end

  create_table "content_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternate_names", comment: "Aliases for the item"
    t.uuid "content_tag_family_id", null: false, comment: "The family to which the tag belongs"
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "data", default: {}, null: false, comment: "A hash to store the data of the item"
    t.text "description", comment: "A description of the item"
    t.jsonb "metadata", default: {}, null: false, comment: "A hash to store some data about the item"
    t.string "name", null: false, comment: "The name of the item"
    t.jsonb "settings", default: {}, null: false, comment: "A hash to configure the item"
    t.string "slug", null: false, comment: "Human readable item identifier"
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.index ["content_tag_family_id"], name: "index_content_tags_on_content_tag_family_id"
    t.index ["created_by_id"], name: "index_content_tags_on_created_by_id"
    t.index ["name", "content_tag_family_id"], name: "index_content_tags_on_name_and_content_tag_family_id", unique: true
    t.index ["slug"], name: "index_content_tags_on_slug", unique: true
    t.index ["updated_by_id"], name: "index_content_tags_on_updated_by_id"
  end

  create_table "contents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternate_names", comment: "Aliases for the item"
    t.uuid "book_id", null: false, comment: "The book in which the item is located"
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "data", default: {}, null: false, comment: "A hash to store the data of the item"
    t.text "description", comment: "A description of the item"
    t.uuid "is_based_on_id", comment: "A content from which this work is derived or from which it is a modification or adaptation"
    t.string "is_based_on_url", comment: "The URL from which the item was imported"
    t.string "kind", null: false, comment: "The kind or type of the item"
    t.jsonb "metadata", default: {}, null: false, comment: "A hash to store some data about the item"
    t.string "name", null: false, comment: "The name of the item"
    t.jsonb "settings", default: {}, null: false, comment: "A hash to configure the item"
    t.text "short_description", comment: "A short description of the item"
    t.string "slug", null: false, comment: "Human readable item identifier"
    t.uuid "thumbnail_id", comment: "A very small image for the item"
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.string "version", comment: "The version of the item"
    t.index ["book_id"], name: "index_contents_on_book_id"
    t.index ["created_by_id"], name: "index_contents_on_created_by_id"
    t.index ["is_based_on_id"], name: "index_contents_on_is_based_on_id"
    t.index ["slug"], name: "index_contents_on_slug", unique: true
    t.index ["thumbnail_id"], name: "index_contents_on_thumbnail_id"
    t.index ["updated_by_id"], name: "index_contents_on_updated_by_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.datetime "created_at"
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "media", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "created_by_id", null: false
    t.jsonb "metadata", default: {}, null: false
    t.string "type", null: false
    t.datetime "updated_at", null: false
    t.uuid "updated_by_id", null: false
    t.index ["created_by_id"], name: "index_media_on_created_by_id"
    t.index ["id", "type"], name: "index_media_on_id_and_type"
    t.index ["type"], name: "index_media_on_type"
    t.index ["updated_by_id"], name: "index_media_on_updated_by_id"
  end

  create_table "pghero_query_stats", force: :cascade do |t|
    t.bigint "calls"
    t.datetime "captured_at", precision: nil
    t.text "database"
    t.text "query"
    t.bigint "query_hash"
    t.float "total_time"
    t.text "user"
    t.index ["database", "captured_at"], name: "index_pghero_query_stats_on_database_and_captured_at"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.jsonb "metadata", comment: "A hash to store some data about the item"
    t.string "name", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "noob", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "akin_content_tags", "content_tags", column: "related_id", on_delete: :cascade
  add_foreign_key "akin_content_tags", "content_tags", column: "relater_id", on_delete: :cascade
  add_foreign_key "books", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "books", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "content_attributes", "contents"
  add_foreign_key "content_attributes", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_attributes", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "content_tag_families", "books"
  add_foreign_key "content_tag_families", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_tag_families", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "content_taggings", "content_tags", on_delete: :cascade
  add_foreign_key "content_taggings", "contents", on_delete: :cascade
  add_foreign_key "content_tags", "content_tag_families"
  add_foreign_key "content_tags", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_tags", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "contents", "books"
  add_foreign_key "contents", "contents", column: "is_based_on_id", on_delete: :nullify
  add_foreign_key "contents", "media", column: "thumbnail_id", on_delete: :cascade
  add_foreign_key "contents", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "contents", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "media", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "media", "users", column: "updated_by_id", on_delete: :restrict
end
