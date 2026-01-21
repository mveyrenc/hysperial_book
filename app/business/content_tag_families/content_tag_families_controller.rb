# frozen_string_literal: true

# ContentTagFamilies controller
module ContentTagFamilies
  # ContentTagFamiliesController controller
  class ContentTagFamiliesController < ApplicationController
    include IndexSearchActionsConcern
    include NewCreateActionsConcern
    include EditUpdateActionsConcern
    include DestroyActionConcern

    private

    def model
      ContentTagFamily
    end

    def redirect_to_after_create
      content_tag_families_path
    end

    def redirect_to_after_update
      content_tag_families_path
    end

    def redirect_to_after_destroy
      content_tag_families_path
    end

    def strong_params
      params
        .require(:content_tag_family)
        .permit(
          :alternate_names,
          :book_id,
          :description,
          :kind,
          :name,
          :position
        )
    end
  end
end
