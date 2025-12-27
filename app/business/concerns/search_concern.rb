# frozen_string_literal: true

module SearchConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_model
    before :compact_query
    before :set_q

    after :set_where
    after :set_aggs
    after :set_order
    after :set_highlight

    def call
      context.records = context.model.search(context.query[:q])
    end

    private

    def set_model
      raise NotImplementedError
    end

    def compact_query
      context.query.compact_blank!
    end

    def set_q
      context.query.merge!({ q: '*' }) if context.query[:q].nil? || context[:q] == ''
    end

    def set_where; end

    def set_order; end

    def set_highlight
      context.records = context.records.highlight(tag: '<span class="has-background-primary-light">')
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
