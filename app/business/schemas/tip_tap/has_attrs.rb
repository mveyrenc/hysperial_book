# frozen_string_literal: true

module Schemas
  module TipTap
    module HasAttrs
      def attrs
        @table.fetch(:attrs, [])
      end
    end
  end
end
