# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module NoThumbnail
        # Contents card component
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
