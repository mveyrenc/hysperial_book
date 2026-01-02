# frozen_string_literal: true

class AkinContentTagKind
  extend ActiveModel::Translation

  KINDS = %w[limited_relation followable_relation computed excludes suggests].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
