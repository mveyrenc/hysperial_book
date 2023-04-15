# frozen_string_literal: true

module ContentTutorials::ShowView

  class Component < ApplicationViewComponent

    attr_reader :object

    def initialize(object:)
      @object = object
    end
  end

end
