# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        module PlainText
          class Component < ContentAttributes::Components::Form::BaseComponent
            delegate :plain_text, to: :record, prefix: true
          end
        end
      end
    end
  end
end
