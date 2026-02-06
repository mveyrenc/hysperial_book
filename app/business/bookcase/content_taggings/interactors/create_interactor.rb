# frozen_string_literal: true

module Bookcase
  module ContentTaggings
    module Interactors
      # Update a tag
      class CreateInteractor < ApplicationInteractor
        include HydrateRecordWithParamsConcern
        include CreatedByConcern
        include SaveRecordConcern
      end
    end
  end
end
