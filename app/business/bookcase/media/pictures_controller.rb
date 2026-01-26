# frozen_string_literal: true

# Pictures controller
module Bookcase
  module Media
    # Pictures controller
    class PicturesController < MediaController
      private

      def model
        @model = Bookcase::Picture
      end

      def redirect_to_after_create
        media_pictures_url
      end

      def redirect_to_after_update
        media_pictures_url
      end

      def redirect_to_after_destroy
        media_pictures_url
      end

      def strong_params
        params
          .require(:picture)
          .permit(:file)
      end
    end
  end
end
