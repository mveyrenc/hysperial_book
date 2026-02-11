# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module CheckBox
      extend ActiveSupport::Concern

      include Base

      included do
        def check_box_with_bulma(method, options = {}, checked_value = '1', unchecked_value = '0')
          options = options.symbolize_keys!
          check_box_options = options.except(:class, :label, :label_class, :error_message, :help, :inline, :custom,
                                             :hide_label, :skip_label, :wrapper_class)
          wrapper_class = ['field', options[:wrapper_class]].compact

          @template.content_tag(:div, class: wrapper_class) do
            checkbox = @template.content_tag(:label, class: 'checkbox') do
              html = check_box_without_bulma(method, check_box_options, checked_value, unchecked_value)
              html.concat(check_box_label(method, options)) unless options[:skip_label]
              html
            end
            checkbox.concat(field_help(method, options))
            checkbox
          end
        end

        bulma_alias(:check_box)
      end

      private

      def check_box_label(method, options)
        return @template.content_tag(:span, options[:label], class: 'control-label') if options[:label]
        @template.content_tag(:span, object.class.human_attribute_name(method), class: 'control-label')
      end
    end
  end
end
