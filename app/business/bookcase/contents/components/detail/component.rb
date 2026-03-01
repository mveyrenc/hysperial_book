# frozen_string_literal: true

module Bookcase
  module Contents
    module Components
      module Detail
        class Component < ApplicationComponent
          attr_reader :record

          def initialize(record)
            super()
            @record = record
          end

          def content_edit_mode?
            session.fetch(:content_edit_mode, false)
          end
        end
      end
    end
  end
end
