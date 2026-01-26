# frozen_string_literal: true

module Bookcase
  module Media
    module Interactors
      # Destroy a medium
      class DestroyInteractor < ApplicationInteractor
        include DestroyRecordConcern
      end
    end
  end
end
