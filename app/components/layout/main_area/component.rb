# frozen_string_literal: true

module Layout
  module MainArea
    class Component < ApplicationComponent
      attr_reader :turbo_frame_tag_id

      renders_one :hero_body
      renders_one :title
      renders_one :actions
      renders_one :upper_section
      renders_one :left_aside
      renders_one :right_aside
      renders_one :main_section

      def initialize(turbo_frame_tag_id:)
        @turbo_frame_tag_id = turbo_frame_tag_id
      end
    end
  end
end
