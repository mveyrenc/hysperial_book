# frozen_string_literal: true

module Books
  module Logics
    # Update a record
    class Create < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include CreatedByConcern
      include SaveRecordConcern
    end
  end
end
