# frozen_string_literal: true

class SimpleMDEInput < SimpleForm::Inputs::TextInput
      def input_html_classes
        super.push('no-spinner')
      end
end
