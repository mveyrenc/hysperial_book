# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module Submit
      extend ActiveSupport::Concern

      include Base

      included do
        def submit_with_bulma(value = nil, options = {}, &block)
          classes = [options[:class]]
          classes <<= 'button'
          options[:class] = classes.compact.join(' ')

          submit_without_bulma(value, options, &block)
        end

        bulma_alias(:submit)
      end
    end
  end
end
