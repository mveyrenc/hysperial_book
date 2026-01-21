# frozen_string_literal: true

module Contents
  module Decorators
    class RecordDecorator < ApplicationDecorator

      delegate :kind

      decorates_association :book, with: Books::Decorators::RecordDecorator
      decorates_associations :content_tags, with: ContentTags::Decorators::RecordDecorator
      decorates_associations :content_attributes, with: ContentAttributes::Decorators::RecordDecorator

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

      def book_name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:book_name)
          context[:highlights][:book_name].html_safe
        else
          book.name
        end
      end

      def kind_name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:kind_name)
          context[:highlights][:kind_name].html_safe
        else
          ContentKind.human_attribute_name(object.kind)
        end
      end

      def thumbnail
        object.thumbnail.file if object.thumbnail.present? && object.thumbnail.file.attached?
      end

      def no_thumbnail_icon
        case kind.to_sym
        when :article
          'article'
        when :tutorial
          'support'
        when :ingredient
          'nutrition'
        when :recipe
          'restaurant'
        when :menu
          'restaurant_menu'
        when :pattern
          'family_history'
        else
          'help_center'
        end
      end

    end
  end
end
