# frozen_string_literal: true

module Shared::FlashMessage

  class Component < ApplicationViewComponent
    def initialize(type:, message:)
      @type = type
      @message = message
    end

    def confetti?
      @type == "confetti"
    end

    def theme
      case @type
      when "alert", "error"
        "bg-red-400"
      else
        "bg-gray-400"
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
