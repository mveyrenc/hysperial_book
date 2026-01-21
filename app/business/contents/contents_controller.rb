# frozen_string_literal: true

# Contents controller
module Contents
  # Contents controller
  class ContentsController < ApplicationController
    include IndexSearchActionsConcern
    include ShowActionConcern
    include NewCreateActionsConcern
    include EditUpdateActionsConcern
    include DestroyActionConcern

    private

    def model
      Content
    end

    def redirect_to_after_create
      contents_path
    end

    def redirect_to_after_update
      contents_path
    end

    def redirect_to_after_destroy
      contents_path
    end

    def strong_params
      params
        .require(:content)
        .permit(
          :book_id,
          :name,
          :alternate_names,
          :kind,
          :version,
          :source_url,
          thumbnail_attributes: %i[id file]
        )
    end

    def set_show_record
      @record = model.friendly.includes(content_tags: [:content_tag_family]).includes(:book).find(params[:id])
    end
  end
end
