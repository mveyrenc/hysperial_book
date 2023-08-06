# frozen_string_literal: true

module Media
  module Interactors
    # List media in the admin panel
    class List < ApplicationInteractor
      def call
        context.list = Medium.all
      end
    end
  end
end
