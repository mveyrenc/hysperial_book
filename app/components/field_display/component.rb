# frozen_string_literal: true

# Display a field if present
module FieldDisplay
  class Component < ApplicationComponent
    attr_reader :label, :value

    def initialize(label:, value:)
      @label = label
      @value = value

      super
    end

    def render?
      value.present?
    end
  end
end
