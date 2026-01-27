# frozen_string_literal: true

module Bookcase
  module Books
    module Components
      module Card
        class Component < ApplicationComponent
          attr_reader :record, :context

          def initialize(record, context: :search_result)
            @record = record
            @context = context
          end
        end
      end
    end
  end
end
