# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Decorators
      class RecordDecorator < ApplicationDecorator
        decorates_association :content, with: Bookcase::Contents::Decorators::RecordDecorator
        decorates_association :content_tag, with: Bookcase::ContentTags::Decorators::RecordDecorator

        def content_tag_name
          content_tag.name
        end

        def content_tag_family_name
          content_tag.content_tag_family_name
        end

        def computed?
          object.new_record?
        end
      end
    end
  end
end
