# frozen_string_literal: true

module Books::Form

  class Component < Books::BookViewComponent
    param :object
  end

  class Preview < Books::BookViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
