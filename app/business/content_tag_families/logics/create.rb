# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # Update a tag
    class Create < ApplicationInteractor
      def call
        create_from_params
      end

      def create_from_params
        split_titles = context.params[:title].split("\n")
        params = context.params.except(:title)
        context.records = []
        split_titles.each do |title|
          create_one(params, title, context.current_user)
        end
      end

      def create_one(params, title, current_user)
        record = ContentTagFamily.new(params)
        record.title = title
        record.created_by = current_user
        record.updated_by = current_user

        context.fail!(message: 'create_record.failure') unless record.save

        context.records << record
      end
    end
  end
end
