# frozen_string_literal: true

module SearchConcern
  extend ActiveSupport::Concern

  included do
    # any code that you want inside the class that includes this concern

    before :set_page
    before :set_per_page
    after :paginate_results

    private

    def set_page
      context.page = context.page || 1
    end

    def set_per_page
      context.per_page = context.per_page || 12
    end

    def paginate_results
      context.records = context.records.page(context.page).per(context.per_page)
    end
  end

  class_methods do
    # methods that you want to create as class methods on the including class
  end
end
