# frozen_string_literal: true

module Schemas
  module TipTap
    module Registerable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def type_name=(type_name)
          @type_name = type_name
          Registry.register(type_name, self)
        end

        def type_name
          @type_name
        end
      end

      delegate :type_name, to: :class
    end
  end
end
