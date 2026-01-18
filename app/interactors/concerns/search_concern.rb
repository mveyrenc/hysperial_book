# frozen_string_literal: true

module SearchConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_model
    before :compact_query
    before :set_q
    before :init_search_query
    before :set_where
    before :set_aggs
    before :set_order
    before :set_highlight

    after :rearrange_aggs

    def init_search_query
      context.search_query = context.model.search(context.query[:q])
    end

    private

    def set_model
      raise NotImplementedError
    end

    def compact_query
      context.query.compact_blank!
    end

    def set_q
      context.query.merge!({ q: '*' }) if context.query[:q].blank?
    end

    def set_where; end

    def set_aggs; end

    def set_order; end

    def set_highlight
      context.search_query = context.search_query.highlight(tag: '<span class="has-background-primary-light">')
    end

    def call
      context.records = context.search_query.load
      context.aggs = context.records.aggs
    end

    def rearrange_aggs; end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
