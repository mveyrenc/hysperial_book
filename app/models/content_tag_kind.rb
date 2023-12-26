# frozen_string_literal: true

class ContentTagKind
  extend ActiveModel::Translation

  KINDS = %w[main_ingredients seasons special_occasions dish_type world_region
             special_diets sources chefs authors meals courses].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    KINDS.index_by(&:to_sym).to_h
  end
end
