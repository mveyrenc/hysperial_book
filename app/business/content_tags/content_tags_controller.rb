# frozen_string_literal: true

# ContentTags controller
module ContentTags
  # ContentTags controller
  class ContentTagsController < ApplicationController
    include IndexSearchActionsConcern
    include NewCreateActionsConcern
    include EditUpdateActionsConcern
    include DestroyActionConcern

    private

    def model
      ContentTag
    end

    def redirect_to_after_create
      content_tags_path
    end

    def redirect_to_after_update
      content_tags_path
    end

    def redirect_to_after_destroy
      content_tag_path
    end

    def strong_params
      params
        .require(:content_tag)
        .permit(
          :content_tag_family_id,
          :name
        )
    end
  end
end
