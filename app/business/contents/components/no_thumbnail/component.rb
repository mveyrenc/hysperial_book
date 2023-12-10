# frozen_string_literal: true

module Contents
  module Components
    module NoThumbnail
      # Contents card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :kind, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end

        def material_icon
          case record_kind.to_sym
          when :article
            'article'
          when :tutorial
            'support'
          when :ingredient
            'nutrition'
          when :recipe
            'restaurant'
          when :menu
            'restaurant_meni'
          when :pattern
            'family_history'
          else
            'help_center'
          end
        end
      end
    end
  end
end
