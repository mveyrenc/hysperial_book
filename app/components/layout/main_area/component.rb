# frozen_string_literal: true

module Layout
  module MainArea
    class Component < ApplicationComponent
      renders_one :title
      renders_one :header_actions
      renders_one :main_section
    end
  end
end
