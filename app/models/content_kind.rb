# frozen_string_literal: true

class ContentKind
  extend ActiveModel::Translation

  KINDS = %w[article tutorial ingredient recipe menu pattern].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    Hash[KINDS.index_by(&:to_sym)]
  end
end
