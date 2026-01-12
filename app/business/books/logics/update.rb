# frozen_string_literal: true

module Books
  module Logics
    # Update a book
    class Update < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
