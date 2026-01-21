# frozen_string_literal: true

module ContentTags
  module Interactors
    # Update a tag
    class UpdateInteractor < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
