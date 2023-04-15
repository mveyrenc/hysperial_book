# frozen_string_literal: true

class SimpleMDEInput < Formtastic::Inputs::StringInput
      def input_html_classes
        super.push('no-spinner')
      end
end
