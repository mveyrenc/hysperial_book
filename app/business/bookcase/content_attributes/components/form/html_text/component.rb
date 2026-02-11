# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        module HtmlText
          class Component < ContentAttributes::Components::Form::BaseComponent
            delegate :html_text, to: :record, prefix: true
          end
        end
      end
    end
  end
end
