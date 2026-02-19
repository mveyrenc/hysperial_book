# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module Button
      extend ActiveSupport::Concern

      include Base

      included do
        def button_with_bulma(value = nil, options = {}, &)
          classes = [options[:class]]
          classes <<= 'button'
          options[:class] = classes.compact.join(' ')

          button_without_bulma(value, options, &)
        end

        bulma_alias(:button)
      end
    end
  end
end
