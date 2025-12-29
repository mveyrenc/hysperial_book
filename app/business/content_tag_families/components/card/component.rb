# frozen_string_literal: true

module ContentTagFamilies
  module Components
    module Card
      # ContentTags card component
      class Component < ApplicationComponent
        attr_reader :record, :highlights

        delegate :kind, to: :record, prefix: true

        def initialize(record:, highlights: nil)
          @record = record
          @highlights = highlights
        end

        def record_name
          highlights.present? && highlights.key?(:name) ? highlights[:name].html_safe : record.name
        end

        def record_book
          highlights.present? && highlights.key?(:book_name) ? highlights[:book_name].html_safe : record.book
        end

        def record_book_kind
          record.book.kind
        end
      end
    end
  end
end
