# frozen_string_literal: true

module Books
  module Components
    module SearchForm
      # Books search form component
      class Component < ApplicationComponent
        delegate :q, to: :params, prefix: true

        attr_reader :params, :records

        def initialize(params:, records:)
          @params = params
          @records = records
        end

        protected

        def kind_select_values
          records.aggs['kind']['buckets'].map do |agg|
            ["#{BookKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
          end
        end
      end
    end
  end
end
