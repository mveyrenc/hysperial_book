# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module FileField
      extend ActiveSupport::Concern

      include Base

      included do
        def file_field_with_bulma(name, options = {})
          form_field_builder(name, options) do
            classes = [options[:class]]
            classes <<= 'file-input'
            # classes <<= 'is-danger' if error?(name) TODO undefined method `error?'
            options[:class] = classes.compact.join(' ')

            append_file_name(name)
            content_tag(:div, class: 'file has-name is-fullwidth') do
              content_tag(:label, class: 'file-label') do
                file_field_without_bulma(name, options) + content_tag(:span, class: 'file-cta') do
                  content_tag(:span, class: 'file-icon') do
                    content_tag(:span, 'upload', class: 'material-symbols-outlined')
                  end + content_tag(:span, class: 'file-label') do
                    I18n.t('.file_field.choose_file')
                  end
                end + append_file_name(name)
              end
            end
          end
        end

        def append_file_name(name)
          return if object.nil?

          value = object.public_send(name)
          return unless !value.nil? && value.record.persisted? && value.record.file.attached?

          content_tag(:div, value.record.file.filename, class: 'file-name')
        end

        bulma_alias :file_field
      end
    end
  end
end
