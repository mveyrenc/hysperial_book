# frozen_string_literal: true

module Bookcase
  module Books
    module Components
      module Form
        # Books create/edit form component
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
