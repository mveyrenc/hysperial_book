# frozen_string_literal: true

module Books
  module Components
    class NewBookButtonComponent < ApplicationComponent
      delegate :to_partial_path, to: :helpers
    end
  end
end
