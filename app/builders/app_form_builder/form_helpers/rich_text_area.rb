# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module RichTextArea
      extend ActiveSupport::Concern
      include Base

      included do
        def rich_text_area_with_bulma(method, options = {}, html_options = {})
          options[:serializer] = 'json'
          options[:input] = @template.field_id(@object_name, method)
          if @template.respond_to?(:rails_direct_uploads_url)
            html_options["data-direct-upload-url"] = @template.rails_direct_uploads_url
          elsif @template.respond_to?(:main_app) && @template.main_app.respond_to?(:rails_direct_uploads_url)
            html_options["data-direct-upload-url"] = @template.main_app.rails_direct_uploads_url
          end
          if @template.respond_to?(:rails_service_blob_url)
            html_options["data-blob-url-template"] = @template.rails_service_blob_url(":signed_id", ":filename")
          elsif @template.respond_to?(:main_app) && @template.main_app.respond_to?(:rails_service_blob_url)
            html_options["data-blob-url-template"] = @template.main_app.rails_service_blob_url(":signed_id", ":filename")
          end
          Rails.logger.debug(options)
          form_field_builder(method, options, html_options) do
            @template.concat(self.hidden_field method, id: options[:input])
            @template.concat(@template.content_tag('rhino-editor', '', options))
          end
        end

        bulma_alias(:rich_text_area)
      end
    end
  end
end