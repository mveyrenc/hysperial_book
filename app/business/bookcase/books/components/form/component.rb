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

          protected

          def kind_select_values
            BookKind.kinds.map { |key, value| [BookKind.human_attribute_name(key), value] }
          end
        end
      end
    end
  end
end
