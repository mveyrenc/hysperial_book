# frozen_string_literal: true

module Users
  module Interactors
    # Destroy a user
    class DestroyInteractor < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
