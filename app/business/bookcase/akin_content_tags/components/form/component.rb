# frozen_string_literal: true

module Bookcase
  module AkinContentTags
    module Components
      module Form
        # ContentTags card component
        class Component < ApplicationComponent
          delegate :content_tag_family, :name, to: :record, prefix: true

          attr_reader :record

          def initialize(record)
            @record = record
          end

          protected

          def content_tag_families_collection
            # All the tag families in the same book
            Bookcase::ContentTagFamily.where(book_id: record.relater.content_tag_family.object_id)
          end

          def kind_select_values
            Bookcase::AkinContentTagKind.KINDS
                                        .reject { |k| k == :computed }
                                        .map { |k| [Bookcase::AkinContentTagKind.human_attribute_name(k), k] }
          end
        end
      end
    end
  end
end
