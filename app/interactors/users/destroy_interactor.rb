# frozen_string_literal: true

module Users
  # Destroy a user
  class DestroyInteractor
    include Interactor

    def call
      context.user.destroy
    end
  end
end
