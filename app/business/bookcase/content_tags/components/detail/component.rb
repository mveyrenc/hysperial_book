# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Components
      module Detail
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            @record = record
          end

          def all_related_tags
            @all_related_tags ||= Bookcase::AkinContentTags::Decorators::RecordDecorator.decorate_collection(Bookcase::AkinContentTag.all_related_tags(record.object))
          end

          def all_relater_tags
            @all_relater_tags ||= Bookcase::AkinContentTags::Decorators::RecordDecorator.decorate_collection(Bookcase::AkinContentTag.all_relater_tags(record.object))
          end
        end
      end
    end
  end
end
