# frozen_string_literal: true

module Contents
  module Interactors
    # Destroy a user
    class DestroyInteractor < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
