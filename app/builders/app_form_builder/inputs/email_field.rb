# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module EmailField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:email_field)
      end
    end
  end
end
