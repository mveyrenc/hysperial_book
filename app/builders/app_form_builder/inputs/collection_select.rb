# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module CollectionSelect
      extend ActiveSupport::Concern
      include Base

      included do
        def collection_select_with_bulma(method, collection, value_method, text_method, options = {}, html_options = {})
          html_options[:required] = options[:required]

          div_class = ['select']
          div_class.push('is-fullwidth') if options.delete(:fullwidth)
          div_class.push('is-multiple') if html_options[:multiple]

          form_field_builder(method, options, html_options) do
            content_tag(:div, class: div_class.join(' ')) do
              collection_select_without_bulma(method, collection, value_method, text_method, options, html_options)
            end
          end
        end

        bulma_alias(:collection_select)
      end
    end
  end
end
