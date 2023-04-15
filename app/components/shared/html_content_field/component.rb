# frozen_string_literal: true

module Shared::HtmlContentField

  class Component < ApplicationViewComponent

    COLOR_DEFAULT = :gray
    COLOR_MAPPINGS = {
      :gray => "prose-gray",
      :slate => "prose-slate",
      :zinc => "prose-zinc",
      :neutral => "prose-neutral",
      :stone => "prose-stone"
    }
    COLOR_OPTIONS = COLOR_MAPPINGS.keys

    def initialize(
      text:,
      color: 'gray',
      **system_arguments
    )
      @text = text
      @color = color

      @system_arguments = system_arguments
      @system_arguments[:classes] = class_names(
        @system_arguments[:classes],
        "prose",
        COLOR_MAPPINGS[fetch_or_fallback(COLOR_OPTIONS, color, COLOR_DEFAULT)],
        "max-w-none"
      )
    end

    def render?
      !text.blank?
    end

    def call
      render Shared::Base::Component.new(tag: :article, **@system_arguments).with_content(raw(text))
    end

    private

    attr_reader :text
    attr_reader :wrapper_class

    def prose_color
      if @color == 'gray' or @color == ''
        "prose"
      else
        "prose-#{@color}"
      end
    end
  end

end
