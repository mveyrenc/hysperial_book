# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module Label
      extend ActiveSupport::Concern

      include Base

      included do
        def label_with_bulma(method, text = nil, options = {}, &block)
          classes = [options[:class]]
          classes <<= 'label'
          options[:class] = classes.compact.join(' ')

          label_without_bulma(method, text, options, &block)
        end

        bulma_alias(:label)
      end
    end
  end
end
