# frozen_string_literal: true

module Contents
  module Components
    module Detail
      # Contents card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :name, :alternate_name, :kind_name, :thumbnail, :content_attributes, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end
      end
    end
  end
end
