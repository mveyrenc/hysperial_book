# frozen_string_literal: true

# == Schema Information
#
# Type name: content_kind
#
class CreateContentKindType < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE TYPE content_kind AS ENUM (
          'article',
          'tutorial',
          'ingredient',
          'recipe',
          'menu',
          'pattern'
          )
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE content_kind;
    SQL
  end
end
