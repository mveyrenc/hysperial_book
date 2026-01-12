# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # Update a tag
    class Create < ApplicationInteractor
      include SaveRecordConcern

      def call
        return context.fail!(message: t('.create_record.no_current_user')) unless context.current_user.present?
        hydrate_bulk_with_params
        create_all
      end

      def hydrate_bulk_with_params
        names = context.params[:name].split("\n").reject { |t| t.empty? }.uniq
        params = context.params.merge(created_by: context.current_user, updated_by: context.current_user)
        context.records = []
        names.each do |name|
          context.records << ContentTagFamily.new(params.merge(name: name))
          Rails.logger.debug context.records.last
        end
        context.message = t('.save_record.success')
      end

      def create_all
        context.records.each do |record|
          if record.save
            next
          else
            context.fail!(message: t('.save_record.failure'))
          end
        end
      end
    end
  end
end
