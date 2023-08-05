# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module TextField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:text_field)
      end
    end
  end
end
