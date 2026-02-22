# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Decorators
      class RecordDecorator < ApplicationDecorator
        delegate :position
        decorates_association :book, with: Bookcase::Books::Decorators::RecordDecorator
        decorates_association :content_tags, with: Bookcase::ContentTags::Decorators::RecordDecorator
        # rubocop:disable Rails/OutputSafety

        def name(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:name)
            context[:highlights][:name].html_safe
          else
            object.name
          end
        end

        def alternate_names(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:alternate_names)
            context[:highlights][:alternate_names].html_safe
          else
            object.alternate_names
          end
        end

        def description(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:description)
            context[:highlights][:description].html_safe
          else
            object.description
          end
        end

        def kind_name(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:kind_name)
            context[:highlights][:kind_name].html_safe
          else
            ContentTagFamilyKind.human_attribute_name(object.kind)
          end
        end

        def book_name(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:book_name)
            context[:highlights][:book_name].html_safe
          else
            book.name(false)
          end
        end

        def book_kind_name(highlights: true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:book_kind_name)
            context[:highlights][:book_kind_name].html_safe
          else
            book.kind_name(false)
          end
        end

        # rubocop:enable Rails/OutputSafety
      end
    end
  end
end
