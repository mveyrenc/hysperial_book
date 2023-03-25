# frozen_string_literal: true

module Shared::NavigationMenu::Link

  class Component < ApplicationViewComponent
    option :label
    option :path
    option :active, default: proc { false }

    def css_classes
      if @active
        ""
      else
        "opacity-50"
      end
    end
  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
