# frozen_string_literal: true

module ContentTagFamilies
  module Interactors
    # Update a tag
    class UpdateInteractor < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
