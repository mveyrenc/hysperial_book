# frozen_string_literal: true

module Users
  module Decorators
    class RecordDecorator < ApplicationDecorator

      # rubocop:disable Rails/OutputSafety
      def name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:name)
          context[:highlights][:name].html_safe
        else
          object.name
        end
      end

      def email(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:email)
          context[:highlights][:email].html_safe
        else
          object.email
        end
      end

      def role_name(highlights = true)
        if highlights && context[:highlights].present? && context[:highlights].key?(:role_name)
          context[:highlights][:role_name].html_safe
        else
          UserRole.human_attribute_name(object.role)
        end
      end

      # rubocop:enable Rails/OutputSafety
    end
  end
end
