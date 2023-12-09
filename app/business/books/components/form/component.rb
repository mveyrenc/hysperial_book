# frozen_string_literal: true

module Books
  module Components
    module Form
      # Books card component
      class Component < ApplicationComponent
        delegate :kind, to: :record, prefix: true

        attr_reader :record

        def initialize(record:)
          @record = record

          super
        end
      end
    end
  end
end
