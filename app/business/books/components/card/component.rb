# frozen_string_literal: true

module Books
  module Components
    module Card
      # Books card component
      class Component < ApplicationComponent
        attr_reader :record, :highlights

        delegate :kind_name, :position, to: :record, prefix: true

        def initialize(record:, highlights: nil)
          @record = record
          @highlights = highlights
        end

        def record_name
          highlights.present? && highlights.key?(:name) ? highlights[:name].html_safe : record.name
        end

        def record_alternate_name
          highlights.present? && highlights.key?(:alternate_name) ? highlights[:alternate_name].html_safe : record.alternate_name
        end

        def record_description
          highlights.present? && highlights.key?(:description) ? highlights[:description].html_safe : record.description
        end
      end
    end
  end
end
