# frozen_string_literal: true

module Bookcase
  module AkinContentTags
    module Components
      module Card
        class Component < ApplicationComponent
          attr_reader :record, :context

          def initialize(record, context:)
            super()
            @record = record
            @context = context
          end
        end
      end
    end
  end
end
