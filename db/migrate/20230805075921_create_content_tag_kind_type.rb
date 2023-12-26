# frozen_string_literal: true

class CreateContentTagKindType < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def up
    execute <<-SQL.squish
      CREATE TYPE content_tag_kind AS ENUM (
          'main_ingredients',
          'seasons',
          'special_occasions',
          'dish_type',
          'world_region',
          'special_diets',
          'sources',
          'chefs',
          'authors',
          'meals',
          'courses',
          'thematic'
          )
    SQL
  end
  # rubocop:enable Metrics/MethodLength

  def down
    execute <<-SQL.squish
      DROP TYPE content_tag_kind;
    SQL
  end
end
