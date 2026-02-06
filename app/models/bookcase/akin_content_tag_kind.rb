# frozen_string_literal: true

module Bookcase
  class AkinContentTagKind
    extend ActiveModel::Translation

    KINDS = %w[excludes followable_relation limited_relation suggests].freeze
    COMPUTED_KINDS = %w[computed computed_suggestion computed_exclusion].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kind_select_values
      KINDS
        .reject { |k| k == :computed }
        .map { |k| [human_attribute_name(k), k] }
        .sort
    end
  end
end
