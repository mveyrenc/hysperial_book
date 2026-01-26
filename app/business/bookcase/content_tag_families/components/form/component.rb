# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Components
      module Form
        # ContentTags card component
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record:)
            @record = record
          end

          protected

          def kind_select_values
            ContentTagFamilyKind.kinds.map { |key, value| [ContentTagFamilyKind.human_attribute_name(key), value] }
          end

          def book_collection
            Book.order(:position)
          end
        end
      end
    end
  end
end
