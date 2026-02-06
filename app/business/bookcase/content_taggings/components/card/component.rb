# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Components
      module Card
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end
        end
      end
    end
  end
end
