# frozen_string_literal: true

module ContentTags
  module Components
    module SearchForm
      # Tags search form component
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
      end
    end
  end
end
