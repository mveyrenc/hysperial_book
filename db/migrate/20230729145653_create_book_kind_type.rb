# frozen_string_literal: true

# == Schema Information
#
# Type name: book_kind
#
class CreateBookKindType < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE TYPE book_kind AS ENUM (
          'cooking',
          'care',
          'fabric_art'
          );
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP TYPE book_kind;
    SQL
  end
end
