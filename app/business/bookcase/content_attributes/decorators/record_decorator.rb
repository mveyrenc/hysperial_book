# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Decorators
      class RecordDecorator < ApplicationDecorator
        delegate :name, :body, :body_html, :data, :metadata
      end
    end
  end
end
