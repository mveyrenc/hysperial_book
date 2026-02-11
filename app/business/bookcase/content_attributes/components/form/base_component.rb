# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        class BaseComponent < ApplicationComponent
          attr_reader :record, :f

          def initialize(record, f)
            @record = record
            @f = f
          end
        end
      end
    end
  end
end
