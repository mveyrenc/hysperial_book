# frozen_string_literal: true

class ContentTagFamilyKind
  extend ActiveModel::Translation

  KINDS = %w[ingredient season occasion category geographic_area restriction source author thematic].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
