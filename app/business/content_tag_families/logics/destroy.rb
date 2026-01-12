# frozen_string_literal: true

module ContentTagFamilies
  module Logics
    # Destroy a content tag family
    class Destroy < ApplicationInteractor
      include DestroyRecordConcern
    end
  end
end
