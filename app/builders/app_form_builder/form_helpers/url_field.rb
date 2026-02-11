# frozen_string_literal: true

module AppFormBuilder
  module FormHelpers
    module UrlField
      extend ActiveSupport::Concern

      include Base

      included do
        bulma_field(:url_field)
      end
    end
  end
end
