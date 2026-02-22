# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module GroupedCollectionSelect
      extend ActiveSupport::Concern
      include Base

      included do
        # rubocop:disable Metrics/ParameterLists
        def grouped_collection_select_with_bulma(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
          html_options[:required] = options[:required]

          div_class = ['select']
          div_class.push('is-fullwidth') if options.delete(:fullwidth)
          div_class.push('is-multiple') if html_options[:multiple]

          form_field_builder(method, options, html_options) do
            @template.content_tag(:div, class: div_class.join(' ')) do
              grouped_collection_select_without_bulma(method, collection, group_method, group_label_method,
                                                      option_key_method, option_value_method, options, html_options)
            end
          end
        end

        # rubocop:enable Metrics/ParameterLists

        bulma_alias(:grouped_collection_select)
      end
    end
  end
end
