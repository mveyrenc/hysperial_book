# frozen_string_literal: true

module ContentSoapRecipes::ShowView

  class Component < ApplicationViewComponent

    attr_reader :object

    def initialize(object:)
      @object = object
    end
  end

end
