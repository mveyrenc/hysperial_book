# frozen_string_literal: true

# == Schema Information
#
# Type name: content_medium_kind
#
class CreateContentMediumKindType < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE TYPE content_medium_kind AS ENUM (
          'document',
          'scanned_document',
          'before_picture',
          'during_picture',
          'after_picture'
          )
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE content_medium_kind;
    SQL
  end
end
