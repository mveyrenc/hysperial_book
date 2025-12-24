# frozen_string_literal: true

module ContentAttributes
  module Components
    module AttributeDisplay
      # ContentAttributes display base component
      class BaseComponent < ApplicationComponent
        attr_reader :record

        delegate :kind, :data_type, :data, :metadata, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end

        def render?
          record_data.key?('html_text') || record_data.key?('plain_text') || super
        end
      end
    end
  end
end
