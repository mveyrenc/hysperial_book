# frozen_string_literal: true

module ContentTags
  module Components
    module Form
      # ContentTags card component
      class Component < ApplicationComponent
        delegate :content_tag_family, :title, to: :record, prefix: true

        attr_reader :record

        def initialize(record:)
          @record = record

          super
        end

        protected

        def content_tag_family_group_method
          Book.order(:position)
        end
      end
    end
  end
end
