# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Interactors
      # Destroy a book
      class DestroyInteractor < ApplicationInteractor
        include DestroyRecordConcern
      end
    end
  end
end
