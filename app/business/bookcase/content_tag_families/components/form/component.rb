# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Components
      module Form
        # ContentTags card component
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end

        end
      end
    end
  end
end
