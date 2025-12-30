# frozen_string_literal: true

module Contents
  module Components
    module Card
      # Contents card component
      class Component < ApplicationComponent
        attr_reader :record, :highlights

        delegate :name, :alternate_name, :kind_name, :thumbnail, to: :record, prefix: true

        def initialize(record:, highlights: nil)
          @record = record
          @highlights = highlights
        end
      end
    end
  end
end
