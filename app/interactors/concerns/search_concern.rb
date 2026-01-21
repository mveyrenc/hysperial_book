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

    after :decorate
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

    def decorate
      call_decorator
    end

    def rearrange_aggs; end

    def record_decorator
      "#{context.model.name.pluralize}::Decorators::RecordDecorator"
    end

    def search_result_decorator
      "#{context.model.name.pluralize}::Decorators::SearchResultsDecorator"
    end

    def call_decorator
      sr_decorator = search_result_decorator
      return unless Object.const_defined?(sr_decorator)

      r_decorator = record_decorator
      return unless Object.const_defined?(r_decorator)

      context.records = Kernel.const_get(sr_decorator).decorate(context.records,
                                                                { with: Kernel.const_get(r_decorator) })
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
