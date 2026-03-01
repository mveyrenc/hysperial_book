# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Components
      module ActionButtons
        class Component < ApplicationComponent
          delegate :to_partial_path, to: :helpers
          attr_reader :actions, :record

          def initialize(actions:, record:)
            super()
            @actions = actions
            @record = record
          end

          def render?
            actions.any?
          end
        end
      end
    end
  end
end
