# frozen_string_literal: true

module Bookcase
  module ContentTagFamilies
    module Interactors
      # Destroy a content tag family
      class DestroyInteractor < ApplicationInteractor
        include DestroyRecordConcern
      end
    end
  end
end
