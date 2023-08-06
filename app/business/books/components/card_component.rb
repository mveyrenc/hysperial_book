# frozen_string_literal: true

module Books
  module Components
    # Books card component
    class CardComponent < ApplicationComponent
      attr_reader :record

      delegate :title, :subtitle, :kind_name, :position, to: :record, prefix: true

      def initialize(record:)
        @record = record

        super
      end
    end
  end
end
