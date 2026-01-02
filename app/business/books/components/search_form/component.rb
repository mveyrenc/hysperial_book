# frozen_string_literal: true

module Books
  module Components
    module SearchForm
      # Books search form component
      class Component < ApplicationComponent
        attr_reader :params, :aggs

        def initialize(params:, aggs:)
          @params = params
          @aggs = aggs
        end

        protected

        def params_q
          params[:q] if params[:q] != '*'
        end

        def kind_select_values
          if aggs.aggs.include?('kind') && aggs.aggs['kind'].include?('buckets')
            aggs.aggs['kind']['buckets'].map do |agg|
              ["#{BookKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
            end
          else
            []
          end
        end
      end
    end
  end
end
