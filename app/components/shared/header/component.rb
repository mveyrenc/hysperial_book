# frozen_string_literal: true

module Shared::Header

  class Component < ApplicationViewComponent
    renders_one :title
    renders_one :actions
  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end

