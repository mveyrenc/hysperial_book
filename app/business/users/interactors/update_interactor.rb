# frozen_string_literal: true

module Users
  module Interactors
    # Update a user and his role
    class UpdateInteractor < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
