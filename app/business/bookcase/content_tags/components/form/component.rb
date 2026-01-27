# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Components
      module Form
        # ContentTags card component
        class Component < ApplicationComponent
          delegate :content_tag_family, :name, to: :record, prefix: true

          attr_reader :record

          def initialize(record)
            @record = record
          end

          protected

          def book_collection
            Book.includes([:content_tag_families]).order(:position)
          end
        end
      end
    end
  end
end
