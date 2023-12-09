# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module ImageField
      extend ActiveSupport::Concern

      include Base

      included do
        def image_field(name, options = {})
          form_field_builder(name, options) do
            classes = [options[:class]]
            classes <<= 'file-input'
            # classes <<= 'is-danger' if error?(name) TODO undefined method `error?'
            options[:class] = classes.compact.join(' ')

            content_tag(:div, class: 'file has-name is-boxed is-center') do
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
          value = object.public_send(name)
          return unless !value.nil? && value.record.persisted? && value.record.file.attached?

          content_tag(:div, class: 'file-image image') do
            @template.image_tag(value.record.file.variant(resize_to_limit: [100, 100]))
          end
        end

        # bulma_alias :file_field
      end
    end
  end
end
