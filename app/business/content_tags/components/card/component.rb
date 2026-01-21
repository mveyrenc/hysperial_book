# frozen_string_literal: true

module ContentTags
  module Components
    module Card
      # ContentTags card component
      class Component < ApplicationComponent
        attr_reader :record

        def initialize(record:)
          @record = record
        end
      end
    end
  end
end
