# frozen_string_literal: true

# == Schema Information
#
# Type name: akin_tag_kind
#
class CreateAkinTagKindType < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE TYPE akin_tag_kind AS ENUM (
          'direct',
          'followable',
          'computed'
          )
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE akin_tag_kind;
    SQL
  end
end
