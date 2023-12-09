# frozen_string_literal: true

# Display form errors
module FormErrors
  class Component < ApplicationComponent
    attr_reader :errors

    def initialize(errors:)
      @errors = errors

      super
    end

    def render?
      errors.any?
    end
  end
end
