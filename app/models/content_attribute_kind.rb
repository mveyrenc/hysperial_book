# frozen_string_literal: true

class ContentAttributeKind
  extend ActiveModel::Translation

  KINDS = %w[document scanned_document text quantity supplies tools instructions].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
