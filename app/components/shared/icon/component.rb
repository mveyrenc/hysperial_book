# frozen_string_literal: true

module Shared::Icon

  class Component < ApplicationViewComponent

    param :icon, required: true
    param :style, default: proc { :outlined }

    def call
      css_classes =  "material-symbols-#{style}"
      content_tag(:span, icon, class: css_classes)
    end

  end
end
