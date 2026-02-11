# frozen_string_literal: true

module AppFormBuilder
  module Components
    # Validation
    module Validation
      extend ActiveSupport::Concern

      private

      def error?(method)
        object.respond_to?(:errors) && !(method.nil? || object.errors[method].empty?)
      end

      def error_messages_for(method)
        object.errors.full_messages_for(method).join("\n")
      end
    end
  end
end
