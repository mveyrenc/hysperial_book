# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Components
      module ActionButtons
        class Component < ApplicationComponent
          delegate :to_partial_path, to: :helpers
          attr_reader :record, :actions

          def initialize(actions:, record: nil)
            super
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
