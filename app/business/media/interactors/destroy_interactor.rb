# frozen_string_literal: true

module Media
  module Interactors
    # Destroy a medium
    class DestroyInteractor < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
