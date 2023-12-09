# frozen_string_literal: true

module Layout
  module Flash
    class Component < ApplicationComponent
      delegate :flash, to: :helpers

      def render?
        flash.any?
      end
    end
  end
end
