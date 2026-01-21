# frozen_string_literal: true

module ContentAttributes
  module Decorators
    class RecordDecorator < ApplicationDecorator
      delegate :name, :data, :data_type
    end
  end
end
