# frozen_string_literal: true

# == Schema Information
#
# Type name: content_block_kind
#
class CreateContentBlockKindType < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def up
    execute <<-SQL
      CREATE TYPE content_block_kind AS ENUM (
          'rich_text',
          'yield',
          'divisions_summary',
          'division',
          'equipment',
          'ingredients_summary',
          'ingredients',
          'ingredient',
          'supplies',
          'tools',
          'times',
          'how_to_section',
          'step',
          'direction',
          'nutrition',
          'notes',
          'comment')
    SQL
  end
  # rubocop:enable Metrics/MethodLength

  def down
    execute <<-SQL
      DROP TYPE content_block_kind;
    SQL
  end
end
