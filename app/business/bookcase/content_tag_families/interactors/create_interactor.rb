# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Interactors
      # Update a tag
      class CreateInteractor < ApplicationInteractor
        include SaveRecordConcern

        def call
          return context.fail!(message: t('.create_record.no_current_user')) if context.current_user.blank?

          hydrate_bulk_with_params
          create_all
        end

        def hydrate_bulk_with_params
          names = context.params[:name].split("\n").reject(&:empty?).uniq
          params = context.params.merge(created_by: context.current_user, updated_by: context.current_user)
          context.records = []
          names.each do |name|
            context.records << ContentTagFamily.new(params.merge(name: name))
          end
          context.message = t('.save_record.success')
        end

        def create_all
          context.records.each do |record|
            next if record.save

            context.fail!(message: t('.save_record.failure'))
          end
        end
      end
    end
  end
end
