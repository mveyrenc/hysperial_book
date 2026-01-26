# frozen_string_literal: true

module Bookcase
  module Books
    module Components
      module Card
        # Books card component
        class Component < ApplicationComponent
          attr_reader :record

          # @param record Books::Decorators::RecordDecorator
          def initialize(record:)
            @record = record
          end
        end
      end
    end
  end
end
