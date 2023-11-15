# frozen_string_literal: true

module ContentTags
  module Logics
    # Update a tag
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        split_values = context.params[:value].split("\n")
        params = context.params.except(:value)
        context.records = []
        split_values.each do |value|
          create_one(params, value, context.current_user)
        end
      end

      def create_one(params, value, current_user)
        record = ContentTag.new(params)
        record.value = value
        record.created_by = current_user
        record.updated_by = current_user

        context.fail!(message: 'create_record.failure') unless record.save

        context.records << record
      end
    end
  end
end
