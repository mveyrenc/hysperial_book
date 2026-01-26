# frozen_string_literal: true

module Bookcase
  class AkinContentTagKind
    extend ActiveModel::Translation

    KINDS = %w[computed excludes followable_relation limited_relation suggests].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kinds
      KINDS.index_by(&:to_sym).to_h
    end
  end
end
