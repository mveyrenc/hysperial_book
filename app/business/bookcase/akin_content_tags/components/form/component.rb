# frozen_string_literal: true

module Bookcase
  module AkinContentTags
    module Components
      module Form
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super
            @record = record
          end

          protected

          def content_tag_families_collection
            # All the tag families in the same book
            Bookcase::ContentTagFamily.where(book_id: record.relater.content_tag_family.book_id)
          end
        end
      end
    end
  end
end
