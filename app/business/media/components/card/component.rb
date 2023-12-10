# frozen_string_literal: true

module Media
  module Components
    module Card
      # Media card component
      class Component < ApplicationComponent
        attr_reader :record

        delegate :type, :file, to: :record, prefix: true

        def initialize(record:)
          @record = record

          super
        end

        def render_document
          return render NoRecord::Component.new unless record_file&.attached?

          if record_type == 'Document'
            link_to record_file
          else
            content_tag :figure, class: 'image is-128x128 m-auto' do
              image_tag record_file.variant(resize_to_limit: [128, 128])
            end
          end
        end

        def edit_medium_path(record)
          case record_type
          when 'Document'
            edit_media_document_path(record)
          when 'Picture'
            edit_media_picture_path(record)
          when 'Scan'
            edit_media_scan_path(record)
          else
            raise "Unknown medium type #{record_type}"
          end
        end

        def medium_path(record)
          case record_type
          when 'Document'
            media_document_path(record)
          when 'Picture'
            media_picture_path(record)
          when 'Scan'
            media_scan_path(record)
          else
            raise "Unknown medium type #{record_type}"
          end
        end
      end
    end
  end
end
