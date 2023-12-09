# frozen_string_literal: true

module Contents
  module Components
    class NewContentButtonComponent < ApplicationComponent
      delegate :to_partial_path, to: :helpers
    end
  end
end
