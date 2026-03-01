# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module Card
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
