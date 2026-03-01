# frozen_string_literal: true

module Users
  module Components
    module Form
      # Users card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :role, to: :record, prefix: true

        def initialize(record)
          super()
          @record = record
        end
      end
    end
  end
end
