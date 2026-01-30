# frozen_string_literal: true

module Bookcase
  module AkinContentTags
    module Decorators
      class RecordDecorator < ApplicationDecorator
        decorates_association :related, with: Bookcase::ContentTags::Decorators::RecordDecorator
        decorates_association :relater, with: Bookcase::ContentTags::Decorators::RecordDecorator

        def kind_name(highlights = true)
          if highlights && context[:highlights].present? && context[:highlights].key?(:kind_name)
            context[:highlights][:kind_name].html_safe
          else
            Bookcase::AkinContentTagKind.human_attribute_name(object.kind)
          end
        end
      end
    end
  end
end
