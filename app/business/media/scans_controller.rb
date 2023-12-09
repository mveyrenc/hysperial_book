# frozen_string_literal: true

# Scans controller
module Media
  # Scans controller
  class ScansController < MediaController
    protected

    def model
      Scan
    end

    def media_media_url
      media_scans_url
    end

    def set_record
      @record = Scan.find(params[:id])
    end

    def strong_params
      params.require(:scan).permit(:file)
    end
  end
end
