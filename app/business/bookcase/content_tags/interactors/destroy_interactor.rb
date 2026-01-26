# frozen_string_literal: true

module Bookcase
  module ContentTags
    module Interactors
      # Destroy a content tag
      class DestroyInteractor < ApplicationInteractor
        include DestroyRecordConcern
      end
    end
  end
end
