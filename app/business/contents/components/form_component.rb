# frozen_string_literal: true

module Contents
  module Components
    # Contents card component
    class FormComponent < ApplicationComponent
      delegate :book, :kind, to: :record, prefix: true

      attr_reader :record

      def initialize(record:)
        @record = record

        super
      end
    end
  end
end
