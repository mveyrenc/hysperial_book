# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Decorators
      class RecordDecorator < ApplicationDecorator
        decorates_association :content, with: Bookcase::Contents::Decorators::RecordDecorator
        decorates_association :content_tag, with: Bookcase::ContentTags::Decorators::RecordDecorator

        delegate :name, to: :content_tag, prefix: true

        delegate :content_tag_family_name, to: :content_tag

        def computed?
          object.new_record?
        end
      end
    end
  end
end
