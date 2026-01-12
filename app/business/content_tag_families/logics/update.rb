# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # Update a tag
    class Update < ApplicationInteractor
      include HydrateRecordWithParamsConcern
      include UpdatedByConcern
      include SaveRecordConcern
    end
  end
end
