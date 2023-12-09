# frozen_string_literal: true

module Contents
  module Components
    # Contents card component
    class CardComponent < ApplicationComponent
      attr_reader :record

      delegate :title, :subtitle, :kind_name, to: :record, prefix: true

      def initialize(record:)
        @record = record

        super
      end
    end
  end
end
