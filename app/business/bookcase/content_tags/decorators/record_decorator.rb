# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Decorators
      class RecordDecorator < ApplicationDecorator
        decorates_association :content_tag_family, with: ContentTagFamilies::Decorators::RecordDecorator

        def name(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:name)
            context[:highlights][:name].html_safe
          else
            object.name
          end
        end

        def alternate_names(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:alternate_names)
            context[:highlights][:alternate_names].html_safe
          else
            object.alternate_names
          end
        end

        def description(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:description)
            context[:highlights][:description].html_safe
          else
            object.description
          end
        end

        def content_tag_family_name(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:content_tag_family_name)
            context[:highlights][:content_tag_family_name].html_safe
          else
            content_tag_family.name(false)
          end
        end

        def book_name(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:book_name)
            context[:highlights][:book_name].html_safe
          else
            content_tag_family.book_name(false)
          end
        end

        def book_kind_name(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:book_kind_name)
            context[:highlights][:book_kind_name].html_safe
          else
            content_tag_family.kind_name(false)
          end
        end
      end
    end
  end
end
