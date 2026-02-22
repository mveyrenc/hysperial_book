# frozen_string_literal: true

require 'action_view'
require 'uri'

module Schemas
  module TipTap
    module HtmlRenderable
      include ActionView::Helpers::TextHelper
      include ActionView::Helpers::AssetTagHelper
      include ActiveSupport::Inflector

      # ActionView::Helpers::TagHelper requires output_buffer accessor
      # This is included by ActionView::Helpers::TextHelper
      attr_accessor :output_buffer

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def html_tag=(name_or_proc)
          @html_tag = name_or_proc
        end

        def html_tag
          @html_tag
        end

        def html_class_name=(name_or_proc)
          @html_class_name = name_or_proc
        end

        def html_class_name
          @html_class_name
        end
      end

      def html_tag
        tag = self.class.html_tag
        case tag
        when Proc
          instance_eval(&tag)
        else
          tag
        end
      end

      def html_class_name
        classes = self.class.html_class_name
        case classes
        when Proc
          instance_eval(&classes)
        else
          classes
        end
      end

      def to_html
        if text?
          inner_text = text
          marks.reverse_each do |mark|
            Rails.logger.debug pretty_inspect

            inner_text = content_tag(mark.html_tag, inner_text, mark.html_attributes)
          end
          return inner_text
        end
        return safe_join(content.map(&:to_html)) if html_tag.nil?

        content_tag(html_tag, safe_join(content.map(&:to_html)), html_attributes) if block?
      end

      def html_attributes
        { style: inline_styles, class: html_class_name }.compact_blank
      end

      def inline_styles
        styles = []
        styles.join(' ')
      end
    end
  end
end
