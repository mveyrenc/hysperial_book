# frozen_string_literal: true

module PaginatedConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_page
    before :set_per_page
    after :paginate_results

    private

    def set_page
      context.page = context.query[:page] || 1
    end

    def set_per_page
      context.per_page = context.per_page || 20
    end

    def paginate_results
      context.records = context.records.page(context.page)
      context.records = if context.records.respond_to? :per_page
                          context.records.per_page(context.per_page)
                        else
                          context.records.per(context.per_page)
                        end
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
