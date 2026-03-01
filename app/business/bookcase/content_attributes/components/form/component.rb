# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super()
            @record = record
          end
        end
      end
    end
  end
end
