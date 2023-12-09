# frozen_string_literal: true

module Layout
  class MainAreaComponent < ApplicationComponent
    renders_one :title
    renders_one :main_section
  end
end
