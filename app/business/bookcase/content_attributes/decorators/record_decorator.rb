# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Decorators
      class RecordDecorator < ApplicationDecorator
        delegate :name, :html_text, :plain_text, :data, :data_type, :metadata
      end
    end
  end
end
