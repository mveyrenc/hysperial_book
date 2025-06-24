# frozen_string_literal: true

module ContentTagFamilies
  module Components
    module NewButton
      class Component < ApplicationComponent
        delegate :to_partial_path, to: :helpers
      end
    end
  end
end
