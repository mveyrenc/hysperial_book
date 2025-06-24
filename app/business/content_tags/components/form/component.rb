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

        def content_tag_family_select_values
          ContentTagFamily.order(title: :asc)
        end
      end
    end
  end
end
