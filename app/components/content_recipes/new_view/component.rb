# frozen_string_literal: true

module ContentRecipes::NewView

  class Component < ApplicationViewComponent

    param :object

  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
