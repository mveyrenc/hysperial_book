# frozen_string_literal: true

module Bookcase
  class ContentTagFamilyKind
    extend ActiveModel::Translation

    KINDS = %w[author category geographic_area ingredient occasion restriction season source thematic].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kind_select_values
      KINDS
        .map { |k| [human_attribute_name(k), k] }
        .sort
    end
  end
end
