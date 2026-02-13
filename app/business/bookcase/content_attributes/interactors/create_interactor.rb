# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Interactors
      # Update a record
      class CreateInteractor < ApplicationInteractor
        include HydrateRecordWithParamsConcern
        include CreatedByConcern
        include SaveRecordConcern
      end
    end
  end
end
