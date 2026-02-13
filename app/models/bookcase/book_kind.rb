# frozen_string_literal: true

module Bookcase
  class BookKind
    extend ActiveModel::Translation

    KINDS = %w[animals cooking crafts fabric_art garden home_well_being knowledge plant_life].freeze

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
