# frozen_string_literal: true

module Bookcase
  class ContentKind
    extend ActiveModel::Translation

    KINDS = %w[article glossary ingredient menu pattern plant recipe tool tutorial].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kinds
      KINDS.index_by(&:to_sym).to_h
    end
  end
end
