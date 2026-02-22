# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    # Helpers
    module Helpers
      def alert_message(options: {})
        title = options[:title] || I18n.t('errors.messages.alert')
        css = options[:class] || 'notification is-danger'
        return unless object.respond_to?(:errors) && object.errors.full_messages.any?

        @template.content_tag :div, class: css do
          @template.concat @template.content_tag :p, title
          @template.concat error_summary unless options[:error_summary] == false
        end
      end

      def error_summary
        return if object.errors.none?

        @template.content_tag :ul, class: 'error-summary' do
          object.errors.full_messages.each do |error|
            @template.concat @template.content_tag(:li, error)
          end
        end
      end
    end
  end
end
