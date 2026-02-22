# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Components
      module SearchForm
        class Component < ApplicationComponent
          attr_reader :params, :aggs

          def initialize(params:, aggs:)
            super
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
end
