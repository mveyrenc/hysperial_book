# frozen_string_literal: true

require 'ostruct'

require_relative 'tip_tap/base'
require_relative 'tip_tap/mark'
require_relative 'tip_tap/node'
require_relative 'tip_tap/document'
require_relative 'tip_tap/registry'

require_relative 'tip_tap/registerable'
require_relative 'tip_tap/html_renderable'
require_relative 'tip_tap/plain_text_renderable'

require_relative 'tip_tap/marks/background_color'
require_relative 'tip_tap/marks/bold'
require_relative 'tip_tap/marks/code'
require_relative 'tip_tap/marks/color'
require_relative 'tip_tap/marks/emoji'
require_relative 'tip_tap/marks/invisible_characters'
require_relative 'tip_tap/marks/italic'
require_relative 'tip_tap/marks/link'
require_relative 'tip_tap/marks/strike'
require_relative 'tip_tap/marks/subscript'
require_relative 'tip_tap/marks/superscript'
require_relative 'tip_tap/marks/typography'
require_relative 'tip_tap/marks/underline'

require_relative 'tip_tap/nodes/list/bullet_list'
require_relative 'tip_tap/nodes/list/list_item'
require_relative 'tip_tap/nodes/list/list_keymap'
require_relative 'tip_tap/nodes/list/ordered_list'
require_relative 'tip_tap/nodes/list/task_item'
require_relative 'tip_tap/nodes/list/task_list'

require_relative 'tip_tap/nodes/table/table'
require_relative 'tip_tap/nodes/table/table_cell'
require_relative 'tip_tap/nodes/table/table_header'
require_relative 'tip_tap/nodes/table/table_row'

require_relative 'tip_tap/nodes/blockquote'
require_relative 'tip_tap/nodes/code_block'
require_relative 'tip_tap/nodes/hard_break'
require_relative 'tip_tap/nodes/heading'
require_relative 'tip_tap/nodes/highlight'
require_relative 'tip_tap/nodes/horizontal_rule'
require_relative 'tip_tap/nodes/image'
require_relative 'tip_tap/nodes/paragraph'
require_relative 'tip_tap/nodes/table_of_contents'
require_relative 'tip_tap/nodes/text'

module Schemas
  module TipTap
    class Error < StandardError; end
  end
end
