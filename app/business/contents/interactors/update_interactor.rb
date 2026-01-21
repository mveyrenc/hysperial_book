# frozen_string_literal: true

module Contents
  module Interactors
    # Update a content
    class UpdateInteractor < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
