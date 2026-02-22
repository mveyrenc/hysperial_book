# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module CollectionCheckBoxes
      extend ActiveSupport::Concern
      include Base

      included do
        # rubocop:disable Metrics/ParameterLists
        def collection_check_boxes_with_bulma(method, collection, value_method, text_method, options = {}, html_options = {})
          html = form_field_builder(method, options, html_options) do
            @template.content_tag(:div, class: 'checkboxes') do
              collection_check_boxes_without_bulma(method, collection, value_method, text_method, options,
                                                   html_options) do |b|
                @template.content_tag(:label, class: 'checkbox') do
                  @template.concat b.check_box
                  @template.concat @template.content_tag(:span, class: 'control-label mx-1') { b.text }
                end
              end
            end
          end
          hidden_field(method, value: '', multiple: true).concat(html)
        end

        # rubocop:enable Metrics/ParameterLists

        bulma_alias :collection_check_boxes
      end
    end
  end
end
