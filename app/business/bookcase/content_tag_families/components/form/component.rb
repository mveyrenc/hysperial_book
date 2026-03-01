# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Components
      module Form
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super()
            @record = record
          end

          def from_book?
            params.key?(:from) && params[:from] == 'book'
          end
        end
      end
    end
  end
end
