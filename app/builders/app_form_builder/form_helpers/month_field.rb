# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module MonthField
      extend ActiveSupport::Concern

      include Base

      included do
        def month_field_with_bulma(method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            classes = [options[:class]]
            classes <<= 'input'
            # classes <<= 'is-danger' if error?(name) TODO undefined method `error?'
            options[:class] = classes.compact.join(' ')

            options[:value] = object.public_send(method)

            month_field_without_bulma(method, options, html_options)
          end
        end

        bulma_alias :month_field
      end
    end
  end
end
