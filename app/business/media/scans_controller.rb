# frozen_string_literal: true

# Scans controller
module Media
  # Scans controller
  class ScansController < MediaController
    protected

    def model
      @model = Scan
    end

    def redirect_to_after_create
      media_scans_url
    end

    def redirect_to_after_update
      media_scans_url
    end

    def redirect_to_after_destroy
      media_scans_url
    end

    def strong_params
      params
        .require(:scan)
        .permit(:file)
    end
  end
end
