# frozen_string_literal: true

module Books::Card

  class Component < Books::BookViewComponent

    with_collection_parameter :object

    attr_reader :object

    def initialize(object:)
      @object = object
    end

  end

  class Preview < Books::BookViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
