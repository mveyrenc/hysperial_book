# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    # FormFieldBuilder
    module FormFieldBuilder
      extend ActiveSupport::Concern

      private

      def form_field_builder(method, options, html_options = {}, &)
        form_field(method, options, html_options, &)
      end
    end
  end
end
