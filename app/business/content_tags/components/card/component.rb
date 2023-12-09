# frozen_string_literal: true

module ContentTags
  module Components
    module Card
      # ContentTags card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :kind_name, :book, :value, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end
      end
    end
  end
end
