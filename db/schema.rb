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

ActiveRecord::Schema[8.0].define(version: 2023_08_06_142408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "akin_content_tag_kind", ["direct", "followable", "computed"]
  create_enum "book_kind", ["cooking", "care", "fabric_art"]
  create_enum "content_kind", ["article", "tutorial", "ingredient", "recipe", "menu", "pattern"]
  create_enum "content_medium_kind", ["document", "scanned_document", "before_picture", "during_picture", "after_picture"]
  create_enum "content_tag_family_kind", ["ingredient", "season", "occasion", "category", "geographic_area", "restriction", "source", "author", "thematic"]
  create_enum "user_role", ["super_admin", "admin", "contributor", "reader", "noob"]

  create_table "action_text_rich_texts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "akin_content_tags", id: false, force: :cascade do |t|
    t.uuid "relater_id", null: false
    t.uuid "related_id", null: false
    t.enum "kind", null: false, enum_type: "akin_content_tag_kind"
    t.index ["kind"], name: "index_akin_content_tags_on_kind"
    t.index ["related_id"], name: "index_akin_content_tags_on_related_id"
    t.index ["relater_id"], name: "index_akin_content_tags_on_relater_id"
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "slug", null: false
    t.enum "kind", null: false, enum_type: "book_kind"
    t.integer "position"
    t.jsonb "settings", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_books_on_kind"
    t.index ["slug"], name: "index_books_on_slug", unique: true
  end

  create_table "content_media", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.enum "kind", null: false, enum_type: "content_medium_kind"
    t.uuid "content_id", null: false
    t.uuid "medium_id", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_content_media_on_content_id"
    t.index ["created_by_id"], name: "index_content_media_on_created_by_id"
    t.index ["kind"], name: "index_content_media_on_kind"
    t.index ["medium_id"], name: "index_content_media_on_medium_id"
    t.index ["updated_by_id"], name: "index_content_media_on_updated_by_id"
  end

  create_table "content_tag_families", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.enum "kind", null: false, enum_type: "content_tag_family_kind"
    t.uuid "book_id", null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_content_tag_families_on_book_id"
    t.index ["created_by_id"], name: "index_content_tag_families_on_created_by_id"
    t.index ["kind"], name: "index_content_tag_families_on_kind"
    t.index ["slug"], name: "index_content_tag_families_on_slug", unique: true
    t.index ["updated_by_id"], name: "index_content_tag_families_on_updated_by_id"
  end

  create_table "content_taggings", id: false, force: :cascade do |t|
    t.uuid "content_id", null: false
    t.uuid "content_tag_id", null: false
    t.index ["content_id"], name: "index_content_taggings_on_content_id"
    t.index ["content_tag_id"], name: "index_content_taggings_on_content_tag_id"
  end

  create_table "content_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "content_tag_family_id", null: false
    t.string "slug", null: false
    t.string "title"
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_tag_family_id"], name: "index_content_tags_on_content_tag_family_id"
    t.index ["created_by_id"], name: "index_content_tags_on_created_by_id"
    t.index ["slug"], name: "index_content_tags_on_slug", unique: true
    t.index ["title", "content_tag_family_id"], name: "index_content_tags_on_title_and_content_tag_family_id", unique: true
    t.index ["updated_by_id"], name: "index_content_tags_on_updated_by_id"
  end

  create_table "contents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "slug", null: false
    t.enum "kind", null: false, enum_type: "content_kind"
    t.uuid "book_id", null: false
    t.string "version"
    t.string "source_url"
    t.uuid "thumbnail_id", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_contents_on_book_id"
    t.index ["created_by_id"], name: "index_contents_on_created_by_id"
    t.index ["kind"], name: "index_contents_on_kind"
    t.index ["slug"], name: "index_contents_on_slug", unique: true
    t.index ["thumbnail_id"], name: "index_contents_on_thumbnail_id"
    t.index ["updated_by_id"], name: "index_contents_on_updated_by_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "media", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_media_on_created_by_id"
    t.index ["type"], name: "index_media_on_type"
    t.index ["updated_by_id"], name: "index_media_on_updated_by_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.enum "role", enum_type: "user_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "akin_content_tags", "content_tags", column: "related_id", on_delete: :cascade
  add_foreign_key "akin_content_tags", "content_tags", column: "relater_id", on_delete: :cascade
  add_foreign_key "content_media", "contents"
  add_foreign_key "content_media", "media"
  add_foreign_key "content_media", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_media", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "content_tag_families", "books"
  add_foreign_key "content_tag_families", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_tag_families", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "content_taggings", "content_tags", on_delete: :cascade
  add_foreign_key "content_taggings", "contents", on_delete: :cascade
  add_foreign_key "content_tags", "content_tag_families"
  add_foreign_key "content_tags", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "content_tags", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "contents", "books"
  add_foreign_key "contents", "media", column: "thumbnail_id", on_delete: :cascade
  add_foreign_key "contents", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "contents", "users", column: "updated_by_id", on_delete: :restrict
  add_foreign_key "media", "users", column: "created_by_id", on_delete: :restrict
  add_foreign_key "media", "users", column: "updated_by_id", on_delete: :restrict
end
