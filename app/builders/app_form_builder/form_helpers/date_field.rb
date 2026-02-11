# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module DateField
      extend ActiveSupport::Concern

      include Base

      included do
        def date_field_with_bulma(method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            classes = [options[:class]]
            classes <<= 'input'
            # classes <<= 'is-danger' if error?(method) TODO undefined method `error?'
            options[:class] = classes.compact.join(' ')

            date_field_without_bulma(method, options, html_options)
          end
        end

        bulma_alias :date_field
      end
    end
  end
end
