# frozen_string_literal: true

class BookKind
  extend ActiveModel::Translation

  KINDS = %w[cooking care fabric_art].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
