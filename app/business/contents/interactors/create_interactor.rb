# frozen_string_literal: true

module Contents
  module Interactors
    # Update a record
    class CreateInteractor < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include CreatedByConcern
      include SaveRecordConcern
    end
  end
end
