# frozen_string_literal: true

module ContentTutorials::NewView

  class Component < ApplicationViewComponent

    attr_reader :object

    def initialize(object:)
      @object = object
    end
  end

  class ComponentPreview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
