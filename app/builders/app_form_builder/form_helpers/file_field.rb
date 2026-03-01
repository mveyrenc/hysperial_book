# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module FileField
      extend ActiveSupport::Concern

      include Base

      included do
        def file_field_with_bulma(method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            classes = [options[:class]]
            classes <<= 'file-input'
            options[:class] = classes.compact.join(' ')

            options[:direct_upload] = true

            append_file_name(method)
            @template.content_tag(:div, class: 'file has-method is-fullwidth') do
              @template.content_tag(:label, class: 'file-label') do
                file_field_without_bulma(method, options) + @template.content_tag(:span, class: 'file-cta') do
                  @template.content_tag(:span, class: 'file-icon') do
                    @template.content_tag(:span, 'upload', class: 'material-symbols-rounded')
                  end + @template.content_tag(:span, class: 'file-label') do
                    I18n.t('application.file_field.choose_file')
                  end
                end + append_file_name(method)
              end
            end
          end
        end

        def append_file_name(method)
          return if object.nil?

          value = object.public_send(method)
          return unless !value.nil? && value.record.persisted? && value.record.file.attached?

          @template.content_tag(:div, value.record.file.filename, class: 'file-name')
        end

        bulma_alias :file_field
      end
    end
  end
end
