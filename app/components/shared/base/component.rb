# frozen_string_literal: true

module Shared::Base

  class Component < ApplicationViewComponent

    def initialize(tag:, classes: nil, **system_arguments)
      @tag = tag
      @system_arguments = system_arguments
      @content_tag_args = prepare_arguments(@system_arguments.merge(classes: classes))
    end

    def call
      content_tag(@tag, content, @content_tag_args)
    end

    private

    def prepare_arguments(arguments)
      arguments[:class] = arguments[:classes]
      arguments.delete(:classes)
      arguments
    end

  end

  class ComponentPreview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
