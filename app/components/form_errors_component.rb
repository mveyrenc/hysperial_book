# frozen_string_literal: true

# Display form errors
class FormErrorsComponent < ViewComponent::Base
  attr_reader :errors

  def initialize(errors:)
    @errors = errors

    super
  end

  def render?
    errors.any?
  end
end
