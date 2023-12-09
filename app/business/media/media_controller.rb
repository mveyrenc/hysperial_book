# frozen_string_literal: true

# Media controller
module Media
  # Media controller
  class MediaController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]

    # GET /media
    def index
      authorize Medium
      @records = Media::Logics::Search.call(params)

      render template: template_path
    end

    # GET /media/:id/edit
    def edit
      authorize @record

      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # PATCH/PUT /media/:id
    def update
      authorize @record
      result = Media::Logics::Update.call(medium: @record, params: strong_params.to_h)

      if result.success?
        respond_to do |format|
          format.html { redirect_to media_media_url, notice: t('.successfully_updated') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:edit), status: :unprocessable_entity
      end
    end

    # DELETE /media/:id
    def destroy
      authorize @record
      Media::Logics::Destroy.call(medium: @record)

      respond_to do |format|
        format.html { redirect_to media_media_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
      end
    end

    protected

    def template_path(action = nil)
      "media/views/#{action || action_name}"
    end

    def media_media_url
      raise NotImplementedError
    end

    def set_record
      raise NotImplementedError
    end

    def strong_params
      raise NotImplementedError
    end
  end
end
