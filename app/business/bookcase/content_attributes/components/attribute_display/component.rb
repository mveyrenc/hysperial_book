# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end

          def render?
            record.body.present? || record.body_html.present?
          end
        end
      end
    end
  end
end
