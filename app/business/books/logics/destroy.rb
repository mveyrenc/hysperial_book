# frozen_string_literal: true

module Books
  module Logics
    # Destroy a book
    class Destroy < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
