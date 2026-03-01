# frozen_string_literal: true

# Display form errors
module FormErrors
  class Component < ApplicationComponent
    attr_reader :errors

    def initialize(errors:)
      super()
      @errors = errors
    end

    def render?
      errors.any?
    end
  end
end
