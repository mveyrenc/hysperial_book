# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module RichTextArea
      extend ActiveSupport::Concern
      include Base

      included do
        def rich_text_area_with_bulma(method, options = {}, html_options = {})
          options['data-standard-editor-target'] = 'editor'
          if @template.respond_to?(:rails_direct_uploads_url)
            options["data-direct-upload-url"] = @template.rails_direct_uploads_url
          elsif @template.respond_to?(:main_app) && @template.main_app.respond_to?(:rails_direct_uploads_url)
            options["data-direct-upload-url"] = @template.main_app.rails_direct_uploads_url
          end
          if @template.respond_to?(:rails_service_blob_url)
            options["data-blob-url-template"] = @template.rails_service_blob_url(":signed_id", ":filename")
          elsif @template.respond_to?(:main_app) && @template.main_app.respond_to?(:rails_service_blob_url)
            options["data-blob-url-template"] = @template.main_app.rails_service_blob_url(":signed_id", ":filename")
          end
          Rails.logger.debug(options)
          form_field_builder(method, options, html_options) do
            @template.content_tag(:div, '', class: 'rich-text-editor', 'data-controller': 'standard-editor') do
              @template.concat(self.hidden_field(method, 'data-standard-editor-target': 'input'))
              @template.concat(@template.content_tag(:div, '', options))
            end
          end
        end

        bulma_alias(:rich_text_area)
      end
    end
  end
end