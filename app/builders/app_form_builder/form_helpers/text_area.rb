# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module TextArea
      extend ActiveSupport::Concern
      include Base

      included do
        def text_area_with_bulma(method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            classes = [options[:class]]
            classes <<= 'textarea'
            # classes <<= 'is-danger' if @object.error?(name) TODO undefined method `error?'
            options[:class] = classes.compact.join(' ')

            text_area_without_bulma(method, options)
          end
        end

        bulma_alias :text_area
      end
    end
  end
end
