# frozen_string_literal: true

module ContentTags
  module Components
    module Form
      # ContentTags card component
      class Component < ApplicationComponent
        delegate :book, :kind, to: :record, prefix: true

        attr_reader :record

        def initialize(record:)
          @record = record

          super
        end

        protected

        def book_select_values
          Book.order(position: :asc)
        end
      end
    end
  end
end
