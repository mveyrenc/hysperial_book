# frozen_string_literal: true

module Bookcase
  class BookKind
    extend ActiveModel::Translation

    KINDS = %w[animals cooking crafts fabric_art garden home_well_being knowledge plant_life].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kinds
      KINDS.index_by(&:to_sym).to_h
    end
  end
end
