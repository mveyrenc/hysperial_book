# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    # FormBuilder
    module FormField
      extend ActiveSupport::Concern

      def form_field(method, options = {}, _html_options = {}, &block)
        @template.content_tag(:div, class: form_field_classes(options)) do
          @template.concat field_label(method, options) unless options[:hide_label]
          @template.concat @template.content_tag(:div, class: 'control', &block)
          @template.concat field_help(method, options)
        end
      end

      def field_control(&)
        @template.content_tag(:div, class: 'control', &)
      end

      def field_help(_method, options)
        # if error?(method)
        #   @template.content_tag(:p, error_messages_for(method), class: 'help is-danger')
        # end TODO undefined method `error?'
        return if options[:help].blank?

        @template.content_tag(:p, options[:help], class: 'help')
      end

      def field_label(method, options)
        return if options[:label] == false
        classes = %w[label]
        classes << 'required' if options[:required]
        label(method.to_s.delete_suffix('_id').to_sym, options[:label], class: classes)
      end

      def form_field_classes(options)
        classes = %w[field]
        classes << options.delete(:wrapper_class) if options[:wrapper_class].present?
        classes
      end
    end
  end
end
