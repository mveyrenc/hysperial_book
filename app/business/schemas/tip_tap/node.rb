# frozen_string_literal: true

module Schemas
  module TipTap
    class Node < Base
      self.html_tag = 'div'

      self.plain_text_separator = "\n"
    end
  end
end
