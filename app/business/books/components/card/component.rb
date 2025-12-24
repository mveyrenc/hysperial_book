# frozen_string_literal: true

module Books
  module Components
    module Card
      # Books card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :name, :alternate_name, :kind_name, :position, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end
      end
    end
  end
end
