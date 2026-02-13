# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Interactors
      # Update a book
      class UpdateInteractor < ApplicationInteractor
        include HydrateRecordWithParamsConcern
        include UpdatedByConcern
        include SaveRecordConcern
      end
    end
  end
end
