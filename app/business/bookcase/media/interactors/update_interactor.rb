# frozen_string_literal: true

module Bookcase
  module Media
    module Interactors
      # Update a medium
      class UpdateInteractor < ApplicationInteractor
        include HydrateRecordWithParamsConcern
        include UpdatedByConcern
        include SaveRecordConcern
      end
    end
  end
end
