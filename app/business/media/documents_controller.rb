# frozen_string_literal: true

# Documents controller
module Media
  # Documents controller
  class DocumentsController < MediaController
    protected

    def media_media_url
      media_documents_url
    end

    def set_record
      @record = Document.find(params[:id])
    end

    def strong_params
      params.require(:document).permit(:file)
    end
  end
end
