# frozen_string_literal: true

# Documents controller
module Bookcase
  module Media
    # Documents controller
    class DocumentsController < MediaController
      private

      def model
        @model = Bookcase::Document
      end

      def redirect_to_after_create
        media_documents_url
      end

      def redirect_to_after_update
        media_documents_url
      end

      def redirect_to_after_destroy
        media_documents_url
      end

      def strong_params
        params
          .require(:bookcase_document)
          .permit(:file)
      end
    end
  end
end
