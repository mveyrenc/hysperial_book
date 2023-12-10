# frozen_string_literal: true

# Contents controller
module Contents
  # Contents controller
  class ContentsController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]
    before_action :set_new_record, only: %i[create new]
    before_action :authorize_record, only: %i[create new edit update destroy]

    # GET /contents
    def index
      authorize Content
      @records = Contents::Logics::Search.call(params)

      render template: template_path
    end

    # GET /contents/new
    def new
      @record.build_thumbnail

      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # GET /contents/:id/edit
    def edit
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # POST /contents
    def create
      result = Contents::Logics::Create.call(record: @record, params: strong_params.to_h, current_user:)
      if result.success?
        respond_to do |format|
          format.html { redirect_to contents_url, notice: t('.successfully_created') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:new), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contents/:id
    def update
      result = Contents::Logics::Update.call(record: @record, params: strong_params.to_h)

      if result.success?
        respond_to do |format|
          format.html { redirect_to contents_url, notice: t('.successfully_updated') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:edit), status: :unprocessable_entity
      end
    end

    # DELETE /contents/:id
    def destroy
      Contents::Logics::Destroy.call(record: @record)

      respond_to do |format|
        format.html { redirect_to contents_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
      end
    end

    private

    def set_record
      @record = Content.friendly.find(params[:id])
    end

    def set_new_record
      @record = Content.new
    end

    def strong_params
      params
        .require(:content)
        .permit(:book_id, :title, :subtitle, :kind, :version, :source_url,
                thumbnail_attributes: [:file])
    end
  end
end
