# frozen_string_literal: true

# Display a field if present
module FieldDisplay
  class Component < ApplicationComponent
    attr_reader :label, :value

    def initialize(label:, value:)
      super
      @label = label
      @value = value
    end

    def render?
      value.present?
    end
  end
end
