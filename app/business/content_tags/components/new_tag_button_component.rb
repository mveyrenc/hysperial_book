# frozen_string_literal: true

module ContentTags
  module Components
    class NewTagButtonComponent < ApplicationComponent
      delegate :to_partial_path, to: :helpers
    end
  end
end
