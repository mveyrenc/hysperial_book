# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module Form
        # Contents card component
        class Component < ApplicationComponent
          delegate :book, :kind, to: :record, prefix: true

          attr_reader :record

          def initialize(record:)
            @record = record
          end
        end
      end
    end
  end
end
