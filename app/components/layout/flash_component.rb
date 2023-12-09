# frozen_string_literal: true

module Layout
  class FlashComponent < ApplicationComponent
    delegate :flash, to: :helpers

    def render?
      flash.any?
    end
  end
end
