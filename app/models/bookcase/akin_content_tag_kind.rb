# frozen_string_literal: true

module Bookcase
  class AkinContentTagKind
    extend ActiveModel::Translation

    KINDS = %w[excludes followable_relation limited_relation suggests].freeze
    COMPUTED_KINDS = %w[computed computed_suggestion computed_exclusion].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kinds
      KINDS.index_by(&:to_sym).to_h
    end
  end
end
