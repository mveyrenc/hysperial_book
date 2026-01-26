# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module SearchForm
        # Contents search form component
        class Component < ApplicationComponent
          attr_reader :params, :aggs, :book

          def initialize(params:, aggs:, book: nil)
            @params = params
            @aggs = aggs
            @book = book
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
