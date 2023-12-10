# frozen_string_literal: true

# Pictures controller
module Media
  # Pictures controller
  class PicturesController < MediaController
    protected

    def model
      Picture
    end

    def media_media_url
      media_pictures_url
    end

    def set_record
      @record = Picture.find(params[:id])
    end

    def strong_params
      params
        .require(:picture)
        .permit(:file)
    end
  end
end
