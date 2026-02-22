# frozen_string_literal: true

module Layout
  module MainArea
    class Component < ApplicationComponent
      attr_reader :turbo_frame_subject

      renders_one :hero_body
      renders_one :title
      renders_one :actions
      renders_one :upper_section
      renders_one :left_aside
      renders_one :right_aside
      renders_one :main_section

      def initialize(turbo_frame_subject)
        super
        @turbo_frame_subject = turbo_frame_subject
      end

      def render?
        !turbo_frame_subject.nil?
      end

      def turbo_model_frame_tag(&)
        helpers.turbo_frame_tag(helpers.model_dom_id(turbo_frame_subject), &)
      end

      def turbo_object_frame_tag(&)
        if turbo_frame_subject.respond_to?(:to_model)
          helpers.turbo_frame_tag(helpers.dom_id(turbo_frame_subject), &)
        else
          content_tag(:div, &)
        end
      end
    end
  end
end
