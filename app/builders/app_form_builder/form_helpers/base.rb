# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module Base
      extend ActiveSupport::Concern

      ELEMENTS_WITH_INPUT_CLASS = %i[email_field url_field number_field password_field text_field].freeze

      class_methods do
        def bulma_field(object_method)
          define_method "#{object_method}_with_bulma" do |method, options = {}, html_options = {}|
            form_field_builder(method, options, html_options) do
              classes = [options[:class]]
              classes <<= 'input' if ELEMENTS_WITH_INPUT_CLASS.include?(object_method)
              # classes <<= 'is-danger' if error?(method) TODO undefined method `error?'
              options[:class] = classes.compact.join(' ')

              send(:"#{object_method}_without_bulma", method, options)
            end
          end

          bulma_alias(object_method)
        end

        def bulma_alias(object_method)
          alias_method :"#{object_method}_without_bulma", object_method
          alias_method object_method, :"#{object_method}_with_bulma"
        end
      end
    end
  end
end
