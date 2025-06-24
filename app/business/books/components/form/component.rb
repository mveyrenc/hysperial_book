# frozen_string_literal: true

module Books
  module Components
    module Form
      # Books card component
      class Component < ApplicationComponent
        delegate :kind, :kind_name, to: :record, prefix: true

        attr_reader :record

        def initialize(record:)
          @record = record

          super
        end

        protected

        def kind_select_values
          BookKind.kinds.map { |key, value| [BookKind.human_attribute_name(key), value] }
        end
      end
    end
  end
end
