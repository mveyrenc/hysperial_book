# frozen_string_literal: true

module Users
  module Components
    module Card
      # Users card component
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
