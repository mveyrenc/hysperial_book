# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module Detail
        module MainCardEditMode
          class Component < ApplicationComponent
            attr_reader :record

            def initialize(record)
              super()
              @record = record
            end
          end
        end
      end
    end
  end
end
