# frozen_string_literal: true

module ContentTags
  module Components
    module SearchForm
      # Books search form component
      class Component < ApplicationComponent
        attr_reader :params, :records

        def initialize(params:, records:)
          @params = params
          @records = records
        end

        protected

        def params_q
          params[:q] if params[:q] != '*'
        end

        def content_tag_family_kind_select_values
          if records.aggs.include?('content_tag_family_kind') && records.aggs['content_tag_family_kind'].include?('buckets')
            records.aggs['content_tag_family_kind']['buckets'].map do |agg|
              ["#{ContentTagFamilyKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
            end
          else
            []
          end
        end

        def content_tag_family_name_select_values
          if records.aggs.include?('content_tag_family_name') && records.aggs['content_tag_family_name'].include?('buckets')
            records.aggs['content_tag_family_name']['buckets'].map do |agg|
              ["#{agg['key']} (#{agg['doc_count']})", agg['key']]
            end
          else
            []
          end
        end

        def book_kind_select_values
          if records.aggs.include?('book_kind') && records.aggs['book_kind'].include?('buckets')
            records.aggs['book_kind']['buckets'].map do |agg|
              ["#{BookKind.human_attribute_name(agg['key'])} (#{agg['doc_count']})", agg['key']]
            end
          else
            []
          end
        end

        def book_name_select_values
          if records.aggs.include?('book_name') && records.aggs['book_name'].include?('buckets')
            records.aggs['book_name']['buckets'].map do |agg|
              ["#{agg['key']} (#{agg['doc_count']})", agg['key']]
            end
          else
            []
          end
        end
      end
    end
  end
end
