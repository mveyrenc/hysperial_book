# frozen_string_literal: true

module ContentTagFamilies
  module Interactors
    # Destroy a content tag family
    class DestroyInteractor < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
