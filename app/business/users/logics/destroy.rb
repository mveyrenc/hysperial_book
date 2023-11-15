# frozen_string_literal: true

module Users
  module Logics
    # Destroy a user
    class Destroy < ApplicationInteractor
      def call
        context.record.destroy
      end
    end
  end
end
