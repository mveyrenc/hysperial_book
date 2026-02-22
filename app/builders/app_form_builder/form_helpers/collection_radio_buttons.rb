# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module CollectionRadioButtons
      extend ActiveSupport::Concern
      include Base

      included do
        # rubocop:disable Metrics/ParameterLists
        def collection_radio_buttons_with_bulma(method, collection, value_method, text_method, options = {}, html_options = {})
          form_field_builder(method, options, html_options) do
            @template.content_tag(:div, class: 'radios') do
              collection_radio_buttons_without_bulma(method, collection, value_method, text_method, options,
                                                     html_options) do |b|
                @template.content_tag(:label, class: 'radio') do
                  @template.concat b.radio_button
                  @template.concat @template.content_tag(:span, class: 'control-label mx-1') { b.text }
                end
              end
            end
          end
        end

        # rubocop:enable Metrics/ParameterLists

        bulma_alias :collection_radio_buttons
      end
    end
  end
end
