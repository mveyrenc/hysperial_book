# frozen_string_literal: true

# ContentTagFamilies controller
module ContentTagFamilies
  # ContentTagFamiliesController controller
  class ContentTagFamiliesController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]
    before_action :set_new_record, only: %i[create new]
    before_action :authorize_record, only: %i[create new edit update destroy]

    # GET /tags
    def index
      authorize ContentTagFamily
      @records = ContentTagFamilies::Logics::Search.call(params)

      render template: template_path
    end

    # GET /tags/new
    def new
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # GET /tags/:id/edit
    def edit
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # POST /tags
    def create
      result = ContentTagFamilies::Logics::Create.call(record: @record, params: strong_params.to_h, current_user:)
      if result.success?
        @records = result.records
        respond_to do |format|
          format.html { redirect_to content_tag_families_url, notice: t('.successfully_created') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:new), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tags/:id
    def update
      result = ContentTagFamilies::Logics::Update.call(record: @record, params: strong_params.to_h, current_user:)

      if result.success?
        respond_to do |format|
          format.html { redirect_to content_tag_families_url, notice: t('.successfully_updated') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:edit), status: :unprocessable_entity
      end
    end

    # DELETE /tags/:id
    def destroy
      ContentTagFamilies::Logics::Destroy.call(record: @record)

      respond_to do |format|
        format.html { redirect_to content_tag_families_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
      end
    end

    private

    def set_record
      @record = ContentTagFamily.friendly.find(params[:id])
    end

    def set_new_record
      @record = ContentTagFamily.new
    end

    def strong_params
      params
        .require(:content_tag_family)
        .permit(:kind, :title)
    end
  end
end
