# frozen_string_literal: true

module ContentTagFamilies
  module Components
    module Form
      # ContentTags card component
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
