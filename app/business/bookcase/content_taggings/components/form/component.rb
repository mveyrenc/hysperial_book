# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Components
      module Form
        # ContentTags card component
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end

          protected

          def content_tag_families_collection
            # All the tag families in the same book
            Bookcase::ContentTagFamily.includes([:content_tags])
                                      .where(book_id: record.content.book_id)
          end
        end
      end
    end
  end
end
