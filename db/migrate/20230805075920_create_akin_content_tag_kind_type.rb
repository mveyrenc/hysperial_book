# frozen_string_literal: true

# == Schema Information
#
# Type name: akin_tag_kind
#
class CreateAkinContentTagKindType < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE TYPE akin_content_tag_kind AS ENUM (
          'direct',
          'followable',
          'computed'
          )
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP TYPE akin_content_tag_kind;
    SQL
  end
end
