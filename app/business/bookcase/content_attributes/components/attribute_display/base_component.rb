# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module AttributeDisplay
        class BaseComponent < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end

          def render?
            record.html_text.present? || record.plain_text.present? || super
          end
        end
      end
    end
  end
end
