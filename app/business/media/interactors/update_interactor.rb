# frozen_string_literal: true

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
