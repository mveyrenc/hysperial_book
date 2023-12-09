# frozen_string_literal: true

# Display a field if present
class FieldDisplayComponent < ApplicationComponent
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
