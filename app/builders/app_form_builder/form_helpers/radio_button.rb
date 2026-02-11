# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module RadioButton
      extend ActiveSupport::Concern

      include Base

      included do
        def radio_button_with_bulma(method, tag_value, options = {})
          options = options.symbolize_keys!
          radio_button_options = options.except(:class, :label, :label_class, :error_message, :help, :inline, :custom,
                                             :hide_label, :skip_label, :wrapper_class)
          wrapper_class = ['field', options[:wrapper_class]].compact

          @template.content_tag(:div, class: wrapper_class) do
            radio = @template.content_tag(:label, class: 'radio') do
              html = radio_button_without_bulma(method, tag_value, radio_button_options)
              html.concat(radio_button_label(method, options)) unless options[:skip_label]
              html
            end
            radio.concat(field_help(method, options))
            radio
          end
        end

        bulma_alias(:radio_button)
      end

      private

      def radio_button_label(method, options)
        return @template.content_tag(:span, options[:label], class: 'control-label') if options[:label]
        @template.content_tag(:span, object.class.human_attribute_name(method), class: 'control-label')
      end
    end
  end
end
