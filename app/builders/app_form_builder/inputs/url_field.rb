# frozen_string_literal: true

module AppFormBuilder
  module Inputs
    module UrlField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:url_field)
      end
    end
  end
end
