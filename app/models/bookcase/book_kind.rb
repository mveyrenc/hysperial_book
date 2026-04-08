# frozen_string_literal: true

module Bookcase
  class BookKind
    extend ActiveModel::Translation

    KINDS = %w[cooking crafts fabric_art fauna_flora home_well_being knowledge].freeze

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
