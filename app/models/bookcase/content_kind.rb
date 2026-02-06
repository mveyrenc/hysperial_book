# frozen_string_literal: true

module Bookcase
  class ContentKind
    extend ActiveModel::Translation

    KINDS = %w[article glossary ingredient menu pattern plant recipe tool tutorial].freeze

    def initialize(kind)
      @kind = kind
    end

    def self.kind_select_values
      KINDS
        .map { |k| [human_attribute_name(k), k] }
        .sort
    end
  end
end
