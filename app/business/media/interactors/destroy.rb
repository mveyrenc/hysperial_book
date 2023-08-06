# frozen_string_literal: true

module Media
  module Interactors
    # Destroy a user
    class Destroy < ApplicationInteractor
      def call
        context.medium.destroy
      end
    end
  end
end
