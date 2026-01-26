# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Components
      module NewButton
        class Component < ApplicationComponent
          delegate :to_partial_path, to: :helpers
        end
      end
    end
  end
end
