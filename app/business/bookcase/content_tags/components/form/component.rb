# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Components
      module Form
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super()
            @record = record
          end

          protected

          def from_content_tag_family?
            params.key?(:from) && params[:from] == 'content_tag_family'
          end

          def book_collection
            Book.includes([:content_tag_families]).order(:position)
          end
        end
      end
    end
  end
end
