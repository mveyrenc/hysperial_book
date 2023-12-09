# frozen_string_literal: true

module Users
  module Components
    module Card
      # Users card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :email, :name, :role_name, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end
      end
    end
  end
end
