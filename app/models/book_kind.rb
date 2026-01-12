# frozen_string_literal: true

class BookKind
  extend ActiveModel::Translation

  KINDS = %w[cooking body_home_care fabric_art gardening woodworking animals].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
